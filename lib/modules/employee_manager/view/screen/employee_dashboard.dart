import 'package:flutter/material.dart';
import 'package:todo_app/modules/config/route.dart';

class EmployeeDashBoardPage extends StatefulWidget {
  const EmployeeDashBoardPage({super.key});

  @override
  State<EmployeeDashBoardPage> createState() => _EmployeeDashBoardPageState();
}

class _EmployeeDashBoardPageState extends State<EmployeeDashBoardPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Employee List',
          style: theme.textTheme.titleMedium
              ?.copyWith(color: theme.colorScheme.onPrimary),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoute.addEmployee);
        },
        child: Icon(Icons.add, color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
