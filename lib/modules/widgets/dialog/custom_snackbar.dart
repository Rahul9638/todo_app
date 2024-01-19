import 'package:flutter/material.dart';

class CustomSnackbar {
  static void snackBarWithAction(BuildContext context,
      {required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(message, maxLines: 2),
      ),
    );
  }
}
