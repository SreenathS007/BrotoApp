import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<RegisterModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(RegisterModel value) async {
  final studentDB = await Hive.openBox<RegisterModel>("student_db");

  studentDB.put(value.id, value);
  getallstudents();
}

Future<void> getallstudents() async {
  final studentDB = await Hive.openBox<RegisterModel>('student_db');
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  // studentListNotifier.value.add(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<RegisterModel>('student_db');

  await studentDB.deleteAt(id);

  getallstudents();
}

Future<void> updateList(int id, RegisterModel value) async {
  final studentDB = await Hive.openBox<RegisterModel>('student_db');
  studentDB.putAt(id, value);
  getallstudents();
}
