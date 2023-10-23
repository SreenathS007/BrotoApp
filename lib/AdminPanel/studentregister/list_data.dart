import 'dart:io';
import 'package:brototype_app/AdminPanel/studentregister/profile.dart';
import 'package:brototype_app/database/functions/function/adminFunctions/register_std_function.dart';
import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({super.key});

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<RegisterModel> studentList, Widget? child) {
        return ListView.separated(
            itemBuilder: (ctx, indexVal) {
              final studentdata = studentList[indexVal];
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (ctx) {
                    return ScreenProfile(
                        name: studentdata.name,
                        age: studentdata.age,
                        phone: studentdata.phone,
                        address: studentdata.address,
                        photo: studentdata.phone,
                        index: indexVal);
                  }));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(File(studentdata.photo)),
                  ),
                  title: Text(
                    "${studentdata.name}",
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      if (indexVal != null) {
                        popupDialogueBox(indexVal);
                        print("Delete value from $indexVal");
                      } else {
                        print("ID passesd Is null");
                      }
                    },
                    icon: const Icon(Icons.delete),
                    tooltip: 'Delete Profile',
                    color: Colors.red,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: studentList.length);
      },
    );
  }

  //popup dialogue message

  popupDialogueBox(int indexValue) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Do You want to delete this Entry?"),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    deleteStudent(indexValue);
                    Navigator.of(context).pop();
                  },
                  child: const Text("YES")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("NO")),
            ],
          );
        });
  }
}
