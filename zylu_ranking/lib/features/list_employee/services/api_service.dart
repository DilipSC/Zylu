import 'package:dio/dio.dart';
import 'package:zylu_ranking/features/list_employee/model/Employee.dart';

class EmployeeApi {
  final String baseUrl = 'https://860f7424ecff.ngrok-free.app/api/';
  final Dio dio = Dio();

  Future<List<Employee>> fetchEmployee() async {
    try {
      final response = await dio.get('${baseUrl}employee');

      if (response.statusCode == 200) {
        final List<dynamic> list = response.data['employee'];
        return list
            .map((e) => Employee.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load employees: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'API Error: ${e.response?.statusCode} - ${e.response?.data}',
        );
      } else {
        throw Exception('Network Error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error fetching employees: $e');
    }
  }
}
