import 'package:dio/dio.dart';
import 'package:zylu_ranking/features/list_employee/model/Employee.dart';
import 'dart:convert';

class EmployeeApi {
  final String baseUrl = 'http://localhost:8000/api';
  final dio = Dio();

  Future<List<Employee>> fetchEmployee() async {    
    try {
      final res = await dio.get('$baseUrl/employee');

      if (res.statusCode == 200) {
        final data = jsonDecode(res.data);
        final List list = data['employee'];
        return list.map((e) => Employee.fromJson(e)).toList();
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      throw Exception('Error');
    }
  }
}
