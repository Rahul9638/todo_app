part of 'employee_bloc.dart';

class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class EmployeeListRequested extends EmployeeEvent {}

class AddEmployeeRequested extends EmployeeEvent {
  const AddEmployeeRequested({required this.data});

  final EmployeeData data;
}

class RemoveEmployeeRequested extends EmployeeEvent {
  const RemoveEmployeeRequested({required this.index});
  final int index;
}

class UpdateEmployeeRequested extends EmployeeEvent {
  const UpdateEmployeeRequested({required this.empData, required this.index});
  final EmployeeData empData;
  final int index;
}
