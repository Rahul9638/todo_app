import 'package:flutter/material.dart';
import 'package:todo_app/modules/config/route.dart';
import 'package:todo_app/modules/employee_manager/view/screen/add_employee.dart';
import 'package:todo_app/modules/employee_manager/view/screen/employee_dashboard.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (context) {
            return const EmployeeDashBoardPage();
          },
        );
      case AppRoute.addEmployee:
        return MaterialPageRoute(
          builder: (context) {
            return const AddEmployeePage();
          },
        );
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error Page'),
            ),
          );
        });
    }
  }
}
