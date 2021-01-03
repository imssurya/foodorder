import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  static const STRIPE_ID = 'stripeid';

  //static const LIKED_FOOD = 'likedfood';
  //static const LIKED_RESTAURANT = 'likedrestaurant';

  String _name;
  String _email;
  String _id;
  String _stripeId;
  //List _likedFood;
  // List _likedRestaurant;

  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;

  // List get likedFood => _likedFood;
//  List get likedRestaurant => _likedRestaurant;

  UserModel.fromSnaphsot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _stripeId = snapshot.data()[STRIPE_ID];

    // _likedFood = snapshot.data()[LIKED_FOOD] ?? [];
    // _likedRestaurant = snapshot.data()[LIKED_RESTAURANT] ?? [];
  }
}
