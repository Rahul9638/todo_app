import 'package:flutter/material.dart';
import 'package:todo_app/modules/config/app_theme.dart';
import 'package:todo_app/modules/config/route.dart';
import 'package:todo_app/modules/config/route_generator.dart';
import 'package:todo_app/modules/utils/global_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: AppRoute.home,
      theme: CustomTheme.lightTheme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
