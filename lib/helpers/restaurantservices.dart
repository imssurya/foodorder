import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodorder/models/restaurant.dart';

class RestaurantServices {
  String collection = 'restaurants';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RestaurantModel>> getRestaurants() async =>
      _firestore.collection(collection).get().then(
        (restaurant) {
          List<RestaurantModel> restaurants = [];
          for (DocumentSnapshot fbresults in restaurant.docs) {
            restaurants.add(RestaurantModel.fromSnapshot(fbresults));
            print(fbresults);
          }
          print('res');

          return restaurants;
        },
      );
}
