import 'package:flutter/material.dart';
import 'package:todo_app/modules/data/employee_detail.dart';
import 'package:todo_app/modules/employee_manager/view/widget/employe_detail_tile.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key, required this.data});
  final List<EmployeeData> data;

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            children: <Widget>[
              categoryLabel(theme, 'Current Employee'),
              currentEmployee(widget.data),
            ],
          ),
          Column(
            children: <Widget>[
              categoryLabel(theme, 'Previous employees'),
              previousEmployee(widget.data)
            ],
          ),
        ],
      ),
    );
  }

  Widget previousEmployee(List<EmployeeData> data) {
    return Column(
      children: List<Widget>.generate(
          data.length,
          (int index) => Visibility(
              visible: data[index].endDate != null,
              child: EmployeeDetail(employeeData: data[index], index: index))),
    );
  }

  Widget currentEmployee(List<EmployeeData> data) {
    return Column(
      children: List<Widget>.generate(
          data.length,
          (int index) => Visibility(
              visible: data[index].endDate == null,
              child: EmployeeDetail(employeeData: data[index], index: index))),
    );
  }

  Widget categoryLabel(ThemeData theme, String label) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      color: theme.colorScheme.outlineVariant,
      child: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(29, 161, 242, 1)),
      ),
    );
  }
}
