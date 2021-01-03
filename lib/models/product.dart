import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const NAME = 'name';
  static const ID = 'id';
  static const PRICE = 'price';
  static const RATING = 'rating';
  static const RATES = 'rates';
  static const RESTAURANT_ID = 'restaurantid';
  static const RESTAURANT = 'restaurant';
  static const CATEGORY = 'category';
  static const FEATURED = 'featured';
  static const IMAGE = 'image';

  String _id;
  String _name;
  int _restaurantId;
  String _restaurant;
  String _category;
  String _image;
  double _price;
  double _rating;
  int _rates;
  bool _featured;

  String get id => _id;
  String get name => _name;
  int get restaurantId => _restaurantId;
  String get restaurant => _restaurant;
  String get category => _category;
  String get image => _image;
  double get price => _price;
  double get rating => _rating;
  bool get featured => _featured;
  int get rates => _rates;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _restaurantId = snapshot.data()[RESTAURANT_ID];
    _restaurant = snapshot.data()[RESTAURANT];
    _category = snapshot.data()[CATEGORY];
    _image = snapshot.data()[IMAGE];
    _price = snapshot.data()[PRICE].toDouble();
    _rating = snapshot.data()[RATING].toDouble();
    _featured = snapshot.data()[FEATURED];
    _rates = snapshot.data()[RATES];
  }
}
