import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:foodorder/helpers/userservices.dart';
import 'package:foodorder/models/user.dart';
import 'package:flutter/material.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  auth.FirebaseAuth _auth;
  auth.User _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  Status get status => _status;
  UserModel get userModel => _userModel;
  auth.User get user => _user;
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();

  AuthProvider.initialize() : _auth = auth.FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      return true;
    } catch (e) {
      return onError(e.toString());
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then(
        (user) {
          Map<String, dynamic> values = {
            'name': userName.text,
            'email': email.text,
            'id': user.user.uid,
            'likedfood': [],
            'likedrestaurant': []
          };
          _userServices.createUser(values);
        },
      );
      return true;
    } catch (e) {
      return onError(e.toString());
    }
  }

  void signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
  }

  void cleanControllers() {
    email.text = '';
    password.text = '';
    userName.text = '';
  }

  bool onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print('error: ' + error.toString());
    return false;
  }

  Future<void> _onStateChanged(auth.User authUser) async {
    if (authUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = authUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(authUser.uid);
    }
    notifyListeners();
  }
}
