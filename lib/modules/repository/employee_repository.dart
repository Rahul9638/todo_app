import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/modules/data/employee_detail.dart';

class EmployeeRepository {
  static const String _key = 'employee_data';
   Future<List<EmployeeData>> getEmployeeList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_key);
    if (data != null) {
      final List<dynamic> decodedData = json.decode(data) as List<dynamic>;
      return decodedData
          .map((e) => EmployeeData.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return <EmployeeData>[];
    }
  }

   Future<void> saveData(List<EmployeeData> dataList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String data =
        json.encode(dataList.map((EmployeeData e) => e.toJson()).toList());
    prefs.setString(_key, data);
  }

   Future<void> addEmployee(EmployeeData newData) async {
    final List<EmployeeData> dataList = await getEmployeeList();
    dataList.add(newData);
    await saveData(dataList);
  }

   Future<void> updateEmployee(
      int index, EmployeeData updatedData) async {
    final List<EmployeeData> dataList = await getEmployeeList();
    if (index >= 0 && index < dataList.length) {
      dataList[index] = updatedData;
      await saveData(dataList);
    }
  }

   Future<void> deleteEmployee(int index) async {
    final List<EmployeeData> dataList = await getEmployeeList();
    if (index >= 0 && index < dataList.length) {
      dataList.removeAt(index);
      await saveData(dataList);
    }
  }
}
