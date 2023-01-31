import 'package:flutter/material.dart';
import 'components/body_main.dart';

class ListRestaurantScreen extends StatelessWidget {
  const ListRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return const BodyMain();
        } else if (constraints.maxWidth <= 800) {
          return const BodyMain(gridCount: 2);
        } else if (constraints.maxWidth <= 1000) {
          return const BodyMain(gridCount: 3);
        } else if (constraints.maxWidth <= 1200) {
          return const BodyMain(gridCount: 4);
        } else {
          return const BodyMain(gridCount: 5);
        }
      },
    );
  }
}
