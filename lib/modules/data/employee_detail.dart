// To parse this JSON data, do
//
//     final EmployeeData = EmployeeDataFromJson(jsonString);

import 'dart:convert';

EmployeeData EmployeeDataFromJson(String str) =>
    EmployeeData.fromJson(json.decode(str) as Map<String, dynamic>);

String EmployeeDataToJson(EmployeeData data) => json.encode(data.toJson());

class EmployeeData {
  EmployeeData({
    required this.employeeName,
    required this.employeeRole,
    required this.startDate,
    this.endDate,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        employeeName:
            json['employeeName'] == null ? '' : json['employeeName'] as String,
        employeeRole:
            json['employeeRole'] == null ? '' : json['employeeRole'] as String,
        startDate: json['startDate'] == null ? '' : json['startDate'] as String,
        endDate: json['endDate'] == null ? null : json['endDate'] as String,
      );
  final String employeeName;
  final String employeeRole;
  final String startDate;
  final String? endDate;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'employeeName': employeeName,
        'employeeRole': employeeRole,
        'startDate': startDate,
        'endDate': endDate,
      };
}
