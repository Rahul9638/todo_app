import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/modules/data/employee_detail.dart';
import 'package:todo_app/modules/employee_manager/bloc/employee_bloc.dart';
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
  final TextEditingController employeeRole = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController lastDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: getAppBar(theme),
      body: BlocListener<EmployeeBloc, EmployeeState>(
        listener: (BuildContext context, EmployeeState state) {
          addEmployeeListener(context, state);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 20),
              employeeNameField(),
              const SizedBox(height: 20),
              employeRoleField(),
              const SizedBox(height: 20),
              dateField(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: fABButton(),
    );
  }

  void addEmployeeListener(BuildContext context, EmployeeState state) {
    if (state is AddEmployeeLoading) {
    }
    if (state is AddEmployeeSuccess) {
      Navigator.of(context).pop();
    }
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
        children: <Widget>[
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
              onPressed: () {
                BlocProvider.of<EmployeeBloc>(context).add(
                  AddEmployeeRequested(data: getData()),
                );
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }

  EmployeeData getData() => EmployeeData(
        employeeName: employeeName.text,
        employeeRole: employeeRole.text,
        startDate: startDate.text,
        endDate: lastDate.text.isEmpty ? null : lastDate.text,
      );
  AppBar getAppBar(ThemeData theme) => AppBar(
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
      );
  Widget dateField() => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
          onTap: () {
            datePicker(lastDate);
          },
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
  void datePicker(TextEditingController date) {
    showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2030))
        .then((DateTime? value) {
      if (value != null) {
        final DateFormat formatter = DateFormat('dd MMM, yyyy');
        final String formatted = formatter.format(value);
        date.text = formatted;
        setState(() {});
      }
    });
  }

  Widget startDateField() => Expanded(
        child: InputTextField(
          onTap: () {
            datePicker(startDate);
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
            employeeRole.text = role;
            Navigator.of(context).pop();
          });
        },
        readOnly: true,
        controller: employeeRole,
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
