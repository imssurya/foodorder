import 'package:flutter/cupertino.dart';
import 'package:foodorder/helpers/restaurantservices.dart';
import 'package:foodorder/models/restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantServices _restaueantServices = RestaurantServices();
  List<RestaurantModel> restaurants = [];
  RestaurantProvider.initialize() {
    _loadRestaurants();
  }
  _loadRestaurants() async {
    restaurants = await _restaueantServices.getRestaurants();
    notifyListeners();
  }
}
