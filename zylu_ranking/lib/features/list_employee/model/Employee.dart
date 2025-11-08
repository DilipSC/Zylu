class Employee {
  final int id;
  final String name;
  final int experience;
  final bool isActive;
  Employee({
    required this.id,
    required this.name,
    required this.experience,
    required this.isActive,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['employee_name'],
      experience: json['experience_in_years'],
      isActive:
          json['is_active'] is bool
              ? json['is_active']
              : json['is_active'] == 1,
    );
  }
}
