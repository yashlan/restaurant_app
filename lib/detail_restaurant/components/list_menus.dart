import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/local_restaurant.dart';
import 'package:restaurant_app/utils/dialog_utils.dart';

class ListMenus extends StatelessWidget {
  final Restaurant restaurant;
  const ListMenus({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: ListView.builder(
                controller: controller,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: restaurant.menus.foods.length,
                itemBuilder: (context, index) {
                  final String foodName = restaurant.menus.foods[index].name;
                  return InkWell(
                    onTap: () {
                      showAlertDialog(
                          context, 'anda memilih makanan: $foodName');
                    },
                    child: Card(
                      child: Container(
                        color: Colors.amber,
                        child: Center(
                          child: Text(
                            foodName,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: ListView.builder(
                controller: controller,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: restaurant.menus.drinks.length,
                itemBuilder: (context, index) {
                  final String drinkName = restaurant.menus.drinks[index].name;
                  return InkWell(
                    onTap: () {
                      showAlertDialog(
                          context, 'anda memilih minuman: $drinkName');
                    },
                    child: Card(
                      child: Container(
                        color: Colors.redAccent,
                        child: Center(
                          child: Text(
                            drinkName,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.unknown,
      };
}
