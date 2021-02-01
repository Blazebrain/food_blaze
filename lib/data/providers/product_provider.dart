import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../services/product_services.dart';

class ProductsProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> productsList = [];
  List<ProductModel> productsByCategoryList = [];
  List<ProductModel> productsByRestaurantList = [];

  ProductsProvider.initialize() {
    _loadProducts();
  }

  _loadProducts() async {
    productsList = await _productServices.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory(String category) async {
    productsByCategoryList =
        await _productServices.getProductsByCategory(category);
    notifyListeners();
  }

  Future loadProductsByRestaurants(int restaurantId) async {
    productsByRestaurantList =
        await _productServices.getProductsByRestaurant(restaurantId);
    notifyListeners();
  }
}
