import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const PRODUCT_ID = 'productid';
  static const ID = 'id';
  static const AMOUNT = 'amount';
  static const STATUS = 'status';
  static const USER_ID = 'userid';
  static const DESCRIPTION = 'description';
  static const CREATED_AT = 'createdat';

  String _id;
  String _productId;
  double _amount;
  String _status;
  String _userId;
  String _description;
  int _createdAt;

  String get id => _id;
  String get productId => _productId;
  double get amount => _amount;
  String get status => _status;
  String get userId => _userId;
  String get description => _description;
  int get createdAt => _createdAt;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _description = snapshot.data()[DESCRIPTION];
    _productId = snapshot.data()[PRODUCT_ID];
    _amount = snapshot.data()[AMOUNT];
    _status = snapshot.data()[STATUS];
    _userId = snapshot.data()[USER_ID];
    _createdAt = snapshot.data()[CREATED_AT];
  }
}
