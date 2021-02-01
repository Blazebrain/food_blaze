import 'package:flutter/material.dart';
import 'package:food_blaze/data/services/category_services.dart';
import 'package:food_blaze/models/category_model.dart';

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
