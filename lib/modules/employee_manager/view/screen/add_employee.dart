import 'package:flutter/material.dart';
import 'package:todo_app/modules/employee_manager/view/widget/employee_role_bottomsheet.dart';
import 'package:todo_app/modules/widgets/button/filled_button.dart';
import 'package:todo_app/modules/widgets/custom_input_field.dart';
import 'package:todo_app/modules/widgets/input_decoration.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final TextEditingController employeeName = TextEditingController();
  final TextEditingController selectRole = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController lastDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Add Employee',
          style: theme.textTheme.titleMedium
              ?.copyWith(color: theme.colorScheme.onPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            employeeNameField(),
            const SizedBox(height: 20),
            employeRoleField(),
            const SizedBox(height: 20),
            dateField(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: fABButton(),
    );
  }

  Widget fABButton() {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: theme.colorScheme.outlineVariant, width: 2))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          Expanded(
            child: CustomFilledButton(
              size: const Size.fromHeight(50),
              backgroundColor: theme.colorScheme.onSecondary,
              borderRadius: 6,
              onPressed: () {},
              child: Text(
                'Cancel',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: const Color.fromRGBO(29, 161, 242, 1)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CustomFilledButton(
              backgroundColor: theme.colorScheme.secondary,
              borderRadius: 6,
              onPressed: () {},
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }

  Widget dateField() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          startDateField(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.arrow_right_alt_sharp),
          ),
          lastDateField(),
        ],
      );

  Widget lastDateField() => Expanded(
        child: InputTextField(
          onTap: () {},
          readOnly: true,
          controller: lastDate,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
          decoration: CustomInputDecoration.outlineInputDecoration(
              prefixIcon: const Icon(
                Icons.calendar_today,
              ),
              labelText: 'No Date',
              hintText: 'Select Role'),
        ),
      );

  Widget startDateField() => Expanded(
        child: InputTextField(
          onTap: () {
          },
          readOnly: true,
          controller: startDate,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
          decoration: CustomInputDecoration.outlineInputDecoration(
              prefixIcon: const Icon(
                Icons.calendar_today,
              ),
              labelText: 'Today',
              hintText: 'Select Role'),
        ),
      );
  Widget employeRoleField() => InputTextField(
        onTap: () {
          showEmployRoleBottomSheet(context, role: (String role) {
            selectRole.text = role;
            Navigator.of(context).pop();
          });
        },
        readOnly: true,
        controller: selectRole,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.name,
        decoration: CustomInputDecoration.outlineInputDecoration(
            suffixIcon: const Icon(Icons.arrow_drop_down),
            prefixIcon: const Icon(
              Icons.work_outline,
            ),
            labelText: 'Select Role',
            hintText: 'Select Role'),
      );
  Widget employeeNameField() => InputTextField(
        controller: employeeName,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.name,
        decoration: CustomInputDecoration.outlineInputDecoration(
            prefixIcon: const Icon(
              Icons.person_outline,
            ),
            labelText: 'Employee name',
            hintText: 'Employee name'),
      );
}
