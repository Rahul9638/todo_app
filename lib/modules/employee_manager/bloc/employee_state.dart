part of 'employee_bloc.dart';

class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  EmployeeLoaded({required this.employeeData});

  final List<EmployeeData> employeeData;
}

class EmployeeError extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class AddEmployeeLoading extends EmployeeState {}

class AddEmployeeSuccess extends EmployeeState {}

class AddEmployeeError extends EmployeeState {}
