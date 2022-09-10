import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internship_assignment/models/employee_model.dart';
import 'package:internship_assignment/repository/employee_repository.dart';
import 'package:internship_assignment/widgets/helper_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late EmployeeRepository employeeRepository;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    employeeRepository =
        EmployeeRepository(firebaseFirestore: FirebaseFirestore.instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo App'),
      ),
      body: StreamBuilder<List<EmployeeModel>>(
        stream: employeeRepository.getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong ${snapshot.error}');
          }
          if (snapshot.hasData) {
            final List<EmployeeModel> employees = snapshot.data;
            print(employees.length);
            if (employees.isEmpty) {
              return const Text('List is empty');
            } else {
              return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTileWidget(employeeModel: employees[index]);
                },
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
