import 'package:flutter/material.dart';
import '../../../global/responsive.dart';
import '../model/Employee.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;
  const EmployeeTile({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    bool highlight = employee.experience > 5;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.w(4),
        vertical: Responsive.h(1),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: highlight ? Colors.green[50] : Colors.white,
          borderRadius: BorderRadius.circular(Responsive.w(3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: Responsive.w(2),
              offset: Offset(0, Responsive.h(0.4)),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(Responsive.w(3)),
          child: Row(
            children: [
              CircleAvatar(
                radius: Responsive.w(6),
                backgroundColor: highlight ? Colors.green : Colors.blueAccent,
                child: Text(
                  employee.name[0].toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Responsive.sp(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: Responsive.w(4)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.name,
                      style: TextStyle(
                        fontSize: Responsive.sp(15),
                        fontWeight: FontWeight.w600,
                        color: highlight ? Colors.green[900] : Colors.black87,
                      ),
                    ),
                    SizedBox(height: Responsive.h(0.5)),
                    Text(
                      'Experience: ${employee.experience} years',
                      style: TextStyle(
                        fontSize: Responsive.sp(13),
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                employee.isActive ? Icons.check_circle : Icons.cancel,
                color: employee.isActive ? Colors.green : Colors.red,
                size: Responsive.w(6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
