class EmployeeDetail {
  final String employeeName;
  final String role;
  final String joiningDate;
  final String? leavingDate;

  EmployeeDetail({
    required this.employeeName,
    required this.role,
    required this.joiningDate,
    this.leavingDate,
  });
}
