class RestaurantDetailResult {
  RestaurantDetailResult({required this.restaurants});

  RestaurantDetail restaurants;

  factory RestaurantDetailResult.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailResult(
        restaurants: RestaurantDetail.fromJson(json["restaurant"]),
      );
}

class RestaurantDetail {
  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
    required this.categories,
    required this.menus,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  double rating;
  List<Category> categories;
  Menus menus;

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        rating: json["rating"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        menus: json["menus"],
      );
}

class Category {
  Category({required this.name});

  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );
}

class Menus {
  Menus({required this.foods, required this.drinks});

  List<Category> foods;
  List<Category> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods:
            List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
        drinks: List<Category>.from(
            json["drinks"].map((x) => Category.fromJson(x))),
      );
}
