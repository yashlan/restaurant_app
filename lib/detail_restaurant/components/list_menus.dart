import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/local_restaurant.dart';
import 'package:restaurant_app/utils/dialog_utils.dart';

enum MenuType { foods, drinks }

class ListMenus extends StatelessWidget {
  final Restaurant restaurant;
  final MenuType menuType;
  const ListMenus({
    Key? key,
    required this.restaurant,
    required this.menuType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: size.width,
          height: 100,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ListView.builder(
              controller: controller,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: menuType == MenuType.foods
                  ? restaurant.menus.foods.length
                  : restaurant.menus.drinks.length,
              itemBuilder: (context, index) {
                final String menuName = menuType == MenuType.foods
                    ? restaurant.menus.foods[index].name
                    : restaurant.menus.drinks[index].name;
                return InkWell(
                  onTap: () {
                    showAlertDialog(
                        context, 'anda memilih ${menuType.name}: $menuName');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 160,
                      height: 100,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(menuType == MenuType.foods
                              ? 'images/makanan_dummy.jpg'
                              : 'images/minuman_dummy.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.5),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          menuName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
