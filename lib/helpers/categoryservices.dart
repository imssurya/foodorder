import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodorder/models/category.dart';

class CategoryServices {
  String collection = 'categories';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async =>
      _firestore.collection(collection).get().then(
        (category) {
          List<CategoryModel> categories = [];
          for (DocumentSnapshot fbresults in category.docs) {
            categories.add(CategoryModel.fromSnapshot(fbresults));
          }
          return categories;
        },
      );
}
