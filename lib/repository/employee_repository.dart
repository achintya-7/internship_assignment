// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_assignment/models/employee_model.dart';

class EmployeeRepository {
  FirebaseFirestore firebaseFirestore;
  EmployeeRepository({
    required this.firebaseFirestore,
  });

  Stream<List<EmployeeModel>> getUser() => firebaseFirestore
      .collection("employees")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => EmployeeModel.fromMap(doc.data()))
          .toList());

  addUser(Map<String, dynamic> data) {}
}
