import 'package:flutter/material.dart';
import 'package:restaurant_app/detail_restaurant/components/favorite_btn.dart';
import 'package:restaurant_app/detail_restaurant/components/list_menus.dart';
import 'package:restaurant_app/model/local_restaurant.dart';

class BodyDetails extends StatelessWidget {
  final Restaurant restaurant;
  const BodyDetails({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  restaurant.pictureId,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.black.withOpacity(0.75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const FavoriteButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      'images/icon/icon_maps.png',
                      width: 23,
                      height: 23,
                      color: Colors.grey,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        restaurant.city,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    restaurant.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListMenus(restaurant: restaurant),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
