import 'package:flutter/cupertino.dart';
import 'package:foodorder/helpers/categoryservices.dart';
import 'package:foodorder/models/category.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];
  CategoryProvider.initialize() {
    _loadCategories();
  }
  _loadCategories() async {
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }
}
