import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodorder/models/user.dart';

class UserServices {
  String collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) async {
    _firestore.collection(collection).doc(values['id']).set(values);
  }

  void updateUser(Map<String, dynamic> values) async {
    _firestore.collection(collection).doc(values['id']).update(values);
  }

  Future<UserModel> getUserById(String id) async {
    DocumentSnapshot snapdata =
        await _firestore.collection(collection).doc(id).get();

    return UserModel.fromSnaphsot(snapdata);
  }
}
