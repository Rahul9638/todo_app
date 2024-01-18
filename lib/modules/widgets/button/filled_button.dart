import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.onPressed,
    required this.child,
    this.backgroundColor,
    this.size,
    this.elevation,
    this.borderRadius = 4,
  });
  final void Function()? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Size? size;
  final double borderRadius;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backgroundColor,
        ),
        child: child);
  }
}
