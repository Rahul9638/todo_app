import 'package:flutter/material.dart';

class EmployeeRoleBottomSheet extends StatefulWidget {
  final Function(String) role;
  const EmployeeRoleBottomSheet({super.key, required this.role});

  @override
  State<EmployeeRoleBottomSheet> createState() =>
      _EmployeeRoleBottomSheetState();
}

class _EmployeeRoleBottomSheetState extends State<EmployeeRoleBottomSheet> {
  List<String> roleList = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          roleList.length,
          (index) => Column(
            children: [
              InkWell(
                onTap: () {
                  widget.role(roleList[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  child: Text(roleList[index]),
                ),
              ),
              Visibility(
                visible: index != roleList.length - 1,
                child: const Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showEmployRoleBottomSheet(BuildContext context,
    {required Function(String) role}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EmployeeRoleBottomSheet(role: role);
      });
}
