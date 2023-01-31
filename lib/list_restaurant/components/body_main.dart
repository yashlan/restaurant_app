import 'package:flutter/material.dart';
import 'package:restaurant_app/list_restaurant/components/head.dart';
import 'package:restaurant_app/list_restaurant/components/restaurant_list.dart';

class BodyMain extends StatelessWidget {
  final int gridCount;
  const BodyMain({
    super.key,
    this.gridCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Header(),
            gridCount == 0
                ? const RestaurantListView()
                : RestaurantGridView(gridCount: gridCount),
          ],
        ),
      ),
    );
  }
}
