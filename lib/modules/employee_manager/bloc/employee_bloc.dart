import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/data/employee_detail.dart';
import 'package:todo_app/modules/repository/employee_repository.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc(this.empRepo) : super(EmployeeInitial()) {
    on<EmployeeEvent>((EmployeeEvent event, Emitter<EmployeeState> emit) async {
      if (event is EmployeeListRequested) {
        await getEmployee(emit);
      }
      if (event is AddEmployeeRequested) {
        emit(AddEmployeeLoading());
        try {
          await empRepo.addEmployee(event.data).then((void value) {
            emit(AddEmployeeSuccess());
            add(EmployeeListRequested());
          });
        } catch (e) {
          emit(AddEmployeeError());
        }
      }
    });
  }
  final EmployeeRepository empRepo;

  Future<void> getEmployee(Emitter<EmployeeState> emit) async {
    emit(EmployeeLoading());
    try {
      await empRepo.getEmployeeList().then((List<EmployeeData> value) =>
          emit(EmployeeLoaded(employeeData: value)));
    } catch (e) {
      emit(EmployeeError());
    }
  }
}
