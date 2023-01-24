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

  Restaurant.fromJson(
    Map<String, dynamic> restaurant,
  ) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = double.parse(restaurant['rating'].toString());
    Map<String, dynamic> menusJson = restaurant['menus'];
    List<dynamic> foods = menusJson['foods'];
    List<dynamic> drinks = menusJson['drinks'];
    menus = Menus(
      foods: foods.map((food) => '${food['name']}').toList(),
      drinks: drinks.map((drink) => '${drink['name']}').toList(),
    );
  }
}

class Menus {
  late List<String> foods;
  late List<String> drinks;
  Menus({
    required this.foods,
    required this.drinks,
  });
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
