import 'package:flutter/material.dart';
import 'package:todo_app/modules/utils/global_key.dart';

class CustomInputDecoration {
  CustomInputDecoration._internal();
  static InputDecoration outlineInputDecoration({
    String? labelText,
    Widget? suffixIcon,
    String? hintText,
    Widget? prefixIcon,
    String? helperText,
    String? prefixText,
    bool enable = true,
  }) {
    final ThemeData theme = Theme.of(navigatorKey.currentContext!);
    return InputDecoration(
      enabled: enable,
      prefixText: prefixText,
      helperMaxLines: 3,
      counterText: '',
      hintText: hintText,
      labelText: labelText,
      contentPadding: const EdgeInsets.all(4),
      helperText: helperText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  static InputDecoration filledDecoration({
    String? labelText,
    Widget? suffixIcon,
    String? hintText,
    Widget? prefixIcon,
    String? helperText,
    Color? labelColor,
  }) {
    final ThemeData theme = Theme.of(navigatorKey.currentContext!);
    return InputDecoration(
      filled: true,
      hintText: hintText,
      labelText: labelText,
      helperText: helperText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      labelStyle:
          TextStyle(color: labelColor ?? theme.colorScheme.onSurfaceVariant),
      hintStyle:
          TextStyle(color: labelColor ?? theme.colorScheme.onSurfaceVariant),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
