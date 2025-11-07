import 'package:flutter/material.dart';
import '../../../global/responsive.dart';
import '../model/Employee.dart';
import '../services/api_service.dart';
import '../widgets/employee_tile.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final EmployeeApi _service = EmployeeApi();
  late Future<List<Employee>> _employees;

  @override
  void initState() {
    super.initState();
    _employees = _service.fetchEmployee();
  }

  Future<void> _refreshEmployees() async {
    setState(() {
      _employees = _service.fetchEmployee();
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employees Directory',
          style: TextStyle(fontSize: Responsive.sp(18)),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 3,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshEmployees,
        child: FutureBuilder<List<Employee>>(
          future: _employees,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  '❌ Error: ${snapshot.error}',
                  style: TextStyle(fontSize: Responsive.sp(14)),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'No employees found.',
                  style: TextStyle(fontSize: Responsive.sp(14)),
                ),
              );
            }

            final employees = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: Responsive.h(1)),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return EmployeeTile(employee: employees[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
