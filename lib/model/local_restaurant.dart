import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
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

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
        id: restaurant['id'],
        name: restaurant['name'],
        description: restaurant['description'],
        pictureId: restaurant['pictureId'],
        city: restaurant['city'],
        rating: checkDouble(restaurant['rating']),
        menus: Menus.fromJson(restaurant['menus']),
      );
}

class Menus {
  late List<Foods> foods;
  late List<Drinks> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> menus) => Menus(
        foods: List<Foods>.from(
          menus['foods'].map(
            (f) => Foods.fromJson(f),
          ),
        ),
        drinks: List<Drinks>.from(
          menus['drinks'].map(
            (d) => Drinks.fromJson(d),
          ),
        ),
      );
}

class Foods {
  String name;

  Foods({required this.name});

  factory Foods.fromJson(Map<String, dynamic> foods) => Foods(
        name: foods['name'],
      );
}

class Drinks {
  String name;

  Drinks({required this.name});

  factory Drinks.fromJson(Map<String, dynamic> foods) => Drinks(
        name: foods['name'],
      );
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}

double checkDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else {
    return value+.0;
  }
}
