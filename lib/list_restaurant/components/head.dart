import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 28.0),
      child: SizedBox(
        height: size.height * 0.23,
        child: Row(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Restaurant\n',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  TextSpan(
                    text: 'Recommendation restaurant for you!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
