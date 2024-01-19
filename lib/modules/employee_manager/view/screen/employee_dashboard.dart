import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/config/route.dart';
import 'package:todo_app/modules/employee_manager/bloc/employee_bloc.dart';
import 'package:todo_app/modules/employee_manager/view/widget/employee_empty.dart';
import 'package:todo_app/modules/employee_manager/view/widget/employee_loaded.dart';

class EmployeeDashBoardPage extends StatefulWidget {
  const EmployeeDashBoardPage({super.key});

  @override
  State<EmployeeDashBoardPage> createState() => _EmployeeDashBoardPageState();
}

class _EmployeeDashBoardPageState extends State<EmployeeDashBoardPage> {
  @override
  void initState() {
    BlocProvider.of<EmployeeBloc>(context).add(EmployeeListRequested());
    super.initState();
  }

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
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (BuildContext context, EmployeeState state) {
          if (state is EmployeeLoaded && state.employeeData.isEmpty) {
            return const NoEmployeeFoundWidget();
          }
          if (state is EmployeeLoaded && state.employeeData.isNotEmpty) {
            return Column(
              children: [
                Expanded(child: EmployeeList(data: state.employeeData)),
                categoryLabel(theme, 'Swip left to delete'),
              ],
            );
          }
          if (state is EmployeeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<EmployeeBloc>(context).isEdit = false;
          Navigator.of(context).pushNamed(AppRoute.addEmployee);
        },
        child: Icon(Icons.add, color: theme.colorScheme.onPrimary),
      ),
    );
  }

  Widget categoryLabel(ThemeData theme, String label) {
    return Container(
      height: 95,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      color: theme.colorScheme.outlineVariant,
      child: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.outline),
      ),
    );
  }
}
