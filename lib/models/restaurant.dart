import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const NAME = 'name';
  static const ID = 'id';
  static const AVG_PRICE = 'avgprice';
  static const RATING = 'rating';
  static const RATES = 'rates';
  static const IMAGE = 'image';
  static const POPULAR = 'popular';

  int _id;
  String _name;
  String _image;
  double _avgPrice;
  double _rating;
  bool _popular;
  int _rates;

  int get id => _id;
  String get name => _name;
  double get avgPrice => _avgPrice;
  double get rating => _rating;
  String get image => _image;
  bool get popular => _popular;
  int get rates => _rates;

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _image = snapshot.data()[IMAGE];
    _avgPrice = snapshot.data()[AVG_PRICE].toDouble();
    _rating = snapshot.data()[RATING].toDouble();
    _popular = snapshot.data()[POPULAR];
    _rates = snapshot.data()[RATES];
  }
}
