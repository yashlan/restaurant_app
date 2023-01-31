import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.redAccent,
      height: size.height * 0.23,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, top: 28.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  textAlign: TextAlign.left,
                  'Restaurant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width > 350 ? 45 : 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  textAlign: TextAlign.left,
                  'Recommendation restaurant for you!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width > 350 ? 23 : 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
