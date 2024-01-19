import 'package:flutter/material.dart';

class CustomSnackbar {
  static void snackBarWithAction(
    BuildContext context, {
    required String message,
    required VoidCallback onPressed,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(message, maxLines: 2),
        action: SnackBarAction(
          label: 'Retry',
          textColor: Theme.of(context).colorScheme.onPrimary,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
