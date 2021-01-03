import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const IMAGE = 'image';
  static const PRODUCTID = 'productid';
  static const QUANTITY = 'quantity';
  static const PRICE = 'price';

  String _id;
  String _name;
  String _image;
  String _productId;
  int _quantity;
  double _price;

  String get id => _id;
  String get name => _name;
  String get image => _image;
  String get productId => _productId;
  int get quantity => _quantity;
  double get price => _price;

  CartItemModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _image = snapshot.data()[IMAGE];
    _productId = snapshot.data()[PRODUCTID];
    _quantity = snapshot.data()[QUANTITY];
    _price = snapshot.data()[PRICE];
  }
}
