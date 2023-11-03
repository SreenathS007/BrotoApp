import 'package:flutter/material.dart';

class StudentApplied extends StatefulWidget {
  @override
  State<StudentApplied> createState() => _StudentAppliedState();
}

class _StudentAppliedState extends State<StudentApplied> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Applied'),
      ),
    );
  }
}
