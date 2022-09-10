import 'package:flutter/material.dart';
import 'package:internship_assignment/models/employee_model.dart';

class ListTileWidget extends StatelessWidget {
  final EmployeeModel employeeModel;
  const ListTileWidget({Key? key, required this.employeeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(employeeModel.timestamp * 1000);
    int yearWorked = DateTime.now().year - date.year;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: yearWorked >= 5 ? const Color.fromARGB(255, 111, 196, 114) : Colors.white,
      child: ListTile(
        title: Text(employeeModel.name,),
        subtitle: Text("Salary : ${employeeModel.salary.toString()}"),
        trailing: Text("Working since : ${date.year}"),
      ),
    );
  }
}
