import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/config/route.dart';
import 'package:todo_app/modules/employee_manager/bloc/employee_bloc.dart';
import 'package:todo_app/modules/employee_manager/view/widget/employe_detail_tile.dart';

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
            return const Center(
              child: Text('NO EmployeeRecord'),
            );
          }
          if (state is EmployeeLoaded && state.employeeData.isNotEmpty) {
            return Column(
                children: List<Widget>.generate(state.employeeData.length,
                    (int index) {
              return EmployeeDetail(
                  employeeData: state.employeeData[index], index: index);
            }));
          }
          if (state is EmployeeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
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
