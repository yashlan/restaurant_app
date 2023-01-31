import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text(msg),
    ),
  );
}