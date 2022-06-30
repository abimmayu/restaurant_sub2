import 'package:restaurant_app/data/model/restaurant_list_response.dart';

class RestaurantSearchResult {
  RestaurantSearchResult({required this.restaurants});

  List<Restaurant> restaurants;

  factory RestaurantSearchResult.fromJson(Map<String, dynamic> json) =>
      RestaurantSearchResult(
        restaurants:
            List<Restaurant>.from(json["restaurants"].map((x) => x.toJson())),
      );
}