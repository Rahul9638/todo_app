import 'package:flutter/material.dart';
import 'package:todo_app/modules/data/employee_detail.dart';

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
        padding: EdgeInsets.only(left: 20),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(Icons.delete_outline_sharp),
      ),
      onDismissed: (DismissDirection direction) {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  'From ${employeeData.startDate}',
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
}
