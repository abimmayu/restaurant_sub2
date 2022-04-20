import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  late Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toString(),
        menus: Menus.fromJson(json["menus"]));
  }
}

class Menus {
  late List<Foods> foods;
  late List<Foods> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
        foods: List<Foods>.from(json["foods"].map((x) => Foods.fromJson(x))),
        drinks: List<Foods>.from(json["drinks"].map((x) => Foods.fromJson(x))));
  }
}

class Foods {
  late String name;

  Foods({required this.name});

  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(name: json["name"]);
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)["restaurants"];
  return parsed.map((e) => Restaurant.fromJson(e)).toList();
}
