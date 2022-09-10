import 'dart:convert';

class EmployeeModel {
  String name;
  int salary;
  int timestamp;
  
  EmployeeModel({
    required this.name,
    required this.salary,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'salary': salary,
      'timestamp': timestamp,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      name: map['name'] as String,
      salary: map['salary'] as int,
      timestamp: map['timestamp'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) => EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
