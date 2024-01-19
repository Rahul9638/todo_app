import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/modules/data/employee_detail.dart';
import 'package:todo_app/modules/employee_manager/bloc/employee_bloc.dart';
import 'package:todo_app/modules/utils/svg_assets.dart';

class EmployeeDetail extends StatelessWidget {
  const EmployeeDetail(
      {super.key, required this.employeeData, required this.index});
  final EmployeeData employeeData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(employeeData.employeeName),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: SvgPicture.asset(SvgAssetPath.delete),
      ),
      onDismissed: (DismissDirection direction) {
        BlocProvider.of<EmployeeBloc>(context)
            .add(RemoveEmployeeRequested(index: index));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  employeeData.employeeName,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Color.fromRGBO(50, 50, 56, 1),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  employeeData.employeeRole,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Color.fromRGBO(148, 156, 158, 1),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  date(employeeData),
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: Color.fromRGBO(148, 156, 158, 1),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Divider(height: 0, thickness: 0)
        ],
      ),
    );
  }

  String date(EmployeeData data) {
    return data.endDate == null
        ? 'From ${data.startDate}'
        : '${data.startDate} - ${data.endDate}';
  }
}
