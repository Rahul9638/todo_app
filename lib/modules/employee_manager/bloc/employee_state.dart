part of 'employee_bloc.dart';

class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  const EmployeeLoaded({required this.employeeData});

  final List<EmployeeData> employeeData;
}

class EmployeeError extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class AddEmployeeLoading extends EmployeeState {}

class AddEmployeeSuccess extends EmployeeState {}

class AddEmployeeError extends EmployeeState {}

class DeleteEmpLoading extends EmployeeState {}

class DeleteEmpLoaded extends EmployeeState {}

class DeleteEmpError extends EmployeeState {}
