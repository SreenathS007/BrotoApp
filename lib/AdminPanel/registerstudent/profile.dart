import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatefulWidget {
  final String name;
  final String age;
  final String address;
  final String photo;
  final String phone;
  final int index;

  const ScreenProfile(
      {super.key,
      required this.name,
      required this.phone,
      required this.age,
      required this.address,
      required this.photo,
      required this.index});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
