import 'package:flutter/material.dart';

import '../../models/restaurant_models.dart';
import '../services/restaurant_services.dart';

class RestaurantsProvider with ChangeNotifier {
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantModel> restaurantsList = [];
  RestaurantModel restaurant;

  RestaurantsProvider.initialize() {
    loadRestaurants();
  }

  loadRestaurants() async {
    restaurantsList = await _restaurantServices.getRestaurant();
    notifyListeners();
  }

  loadRestaurantsById(int id) async {
    restaurant = await _restaurantServices.getRestaurantById(id);
    notifyListeners();
  }
}
