import 'package:flutter/material.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.redAccent,
      height: size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 28.0,
          right: 28.0,
          top: 28.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  textAlign: TextAlign.left,
                  'Restaurant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width > 350 ? 35 : 25,
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
                    fontSize: size.width > 350 ? 18 : 16,
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

class HeaderWeb extends StatelessWidget {
  const HeaderWeb({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.redAccent,
      height: size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 28.0,
          right: 28.0,
          top: 28.0,
        ),
        child: Column(
          children: [
            Row(
              children: const <Widget>[
                Text(
                  textAlign: TextAlign.left,
                  'Restaurant',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: const <Widget>[
                Text(
                  textAlign: TextAlign.left,
                  'Recommendation restaurant for you!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
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
