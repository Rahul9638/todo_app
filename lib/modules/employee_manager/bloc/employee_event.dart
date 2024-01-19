part of 'employee_bloc.dart';

class EmployeeEvent {}

class EmployeeListRequested extends EmployeeEvent {}

class AddEmployeeRequested extends EmployeeEvent {
  AddEmployeeRequested({required this.data});

  final EmployeeData data;
}

class RemoveEmployeeRequested extends EmployeeEvent {
  RemoveEmployeeRequested({required this.index});
  final int index;
}
