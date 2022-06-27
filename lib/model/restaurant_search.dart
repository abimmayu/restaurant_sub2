import 'package:restaurant_app/model/restaurant.dart';

class SearchRestaurant {
  bool error;
  int found;
  List<Restaurant> restaurants;

  SearchRestaurant({
    required this.error,
    required this.found,
    required this.restaurants,
  });

  factory SearchRestaurant.fromJson(Map<String, dynamic> json) =>
      SearchRestaurant(
        error: json['error'],
        found: json['founded'],
        restaurants: List<Restaurant>.from(json['restaurants']
            .map((restaurant) => Restaurant.fromJson(restaurant))),
      );
  Map<String, dynamic> toJson() => {
        'error': error,
        'founded': found,
        'restaurants': List<dynamic>.from(
            restaurants.map((restaurant) => restaurant.toJson()))
      };
}
