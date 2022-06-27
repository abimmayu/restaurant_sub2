import 'package:restaurant_app/model/restaurant.dart';

class RestaurantDetail {
  bool error;
  String message;
  Restaurant restaurants;

  RestaurantDetail({
    required this.error,
    required this.message,
    required this.restaurants,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        error: json['error'],
        message: json['message'],
        restaurants: Restaurant.fromJson(json['restaurants)']),
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'restaurants': restaurants,
      };
}
