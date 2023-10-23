import 'dart:io';
import 'package:brototype_app/database/functions/function/adminFunctions/register_std_function.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatefulWidget {
  final String name;
  final String age;
  final String address;
  final String photo;
  final String phone;
  final int index;
  const ScreenProfile({
    super.key,
    required this.name,
    required this.age,
    required this.phone,
    required this.address,
    required this.photo,
    required this.index,
  });

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  Widget build(BuildContext context) {
    getallstudents();
    return Scaffold();
  }
}
