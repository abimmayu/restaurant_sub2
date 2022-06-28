import 'package:restaurant_app/model/restaurant.dart';

class RestaurantList {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantList({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantList.fromJson(Map<String, dynamic> json) {
    final bool error = json['error'];
    final String message = json['message'];
    final int count = json['count'];
    final List<Restaurant> restaurants = (json['restaurants'] as List)
        .map((restaurantsJSON) => Restaurant.fromJson(restaurantsJSON))
        .toList();

    return RestaurantList(
      error: error,
      message: message,
      count: count,
      restaurants: restaurants,
    );
  }
}
