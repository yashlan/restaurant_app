import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/dialog_utils.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(
          () {
            isFavorite = !isFavorite;
            if (isFavorite) {
              showAlertDialog(context, 'ditambahkan ke favorit!');
            }
          },
        );
      },
    );
  }
}
