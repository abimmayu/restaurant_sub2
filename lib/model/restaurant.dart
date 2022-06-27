const String baseUrl = "https://restaurant-api.dicoding.dev";

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String address;
  final num rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.address,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    final String id = json['id'];
    final String name = json['name'];
    final String description = json['description'];
    final String pictureId = json['pictureId'];
    final String city = json['city'];
    final String address = json['address'] ?? "";
    final num rating = json['rating'];
    final Menus menus = json['menus'] != null
        ? Menus.fromJson(json['menus'])
        : Menus(foods: [], drinks: []);

    return Restaurant(
      id: id,
      name: name,
      description: description,
      pictureId: pictureId,
      city: city,
      address: address,
      rating: rating,
      menus: menus,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "address": address,
        "rating": rating,
      };

  String get smallPictureUrl => '$baseUrl/images/small/$pictureId';

  String get mediumPictureUrl => '$baseUrl/images/medium/$pictureId';

  String get largePictureUrl => '$baseUrl/images/large/$pictureId';
}

class Menus {
  late List<Food> foods;
  late List<Drink> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    final List<Food> foods = (json['foods'] as List)
        .map((foodJson) => Food.fromJson(foodJson))
        .toList();

    final List<Drink> drinks = (json['drinks'] as List)
        .map((drinkJson) => Drink.fromJson(drinkJson))
        .toList();

    return Menus(foods: foods, drinks: drinks);
  }
}

class Food {
  final String name;

  Food({required this.name});
  factory Food.fromJson(Map<String, dynamic> json) => Food(name: json['name']);
}

class Drink {
  final String name;
  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> json) =>
      Drink(name: json['name']);
}
