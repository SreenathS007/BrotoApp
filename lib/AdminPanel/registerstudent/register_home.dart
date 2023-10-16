import 'package:brototype_app/AdminPanel/registerstudent/add_student.dart';
import 'package:brototype_app/AdminPanel/registerstudent/list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brototype_app/AdminPanel/registerstudent/search.dart';

class screenHome extends StatefulWidget {
  const screenHome({super.key});

  @override
  State<screenHome> createState() => _screenHomeState();
}

class _screenHomeState extends State<screenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Studnt Register'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: ScreenSearch(),
                );
              },
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => ScreenAdd()));
        },
        tooltip: 'Add Student',
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListDataWidget(),
      )),
    );
  }
}
