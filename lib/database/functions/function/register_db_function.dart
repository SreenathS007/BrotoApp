import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');

  studentDB.put(value.id, value);
  getallstudents();
}

Future<void> getallstudents() async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(id);
  getallstudents();
}

Future<void> updateList(int id, StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.putAt(id, value);
  getallstudents();
}
