import 'package:flutter/material.dart';
import 'package:restaurant_app/detail_restaurant/components/body_details.dart';
import 'package:restaurant_app/model/local_restaurant.dart';

class DetailRestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const DetailRestaurantScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetails(restaurant: restaurant),
    );
  }
}
