import 'dart:io';

import 'package:brototype_app/AdminPanel/registerstudent/profile.dart';
import 'package:brototype_app/database/functions/function/register_db_function.dart';
import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDataWidget extends StatefulWidget {
  const ListDataWidget({super.key});

  @override
  State<ListDataWidget> createState() => _ListDataWidgetState();
}

class _ListDataWidgetState extends State<ListDataWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, indexVal) {
            final studentdata = studentList[indexVal];
            return InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (ctx1) {
                  return ScreenProfile(
                    name: studentdata.name,
                    phone: studentdata.phone,
                    age: studentdata.age,
                    address: studentdata.adress,
                    photo: studentdata.photo,
                    index: indexVal,
                  );
                }));
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: FileImage(
                    File(studentdata.photo),
                  ),
                ),
                title: Text(
                  "${studentdata.name}",
                ),
                trailing: IconButton(
                  onPressed: () {
                    if (indexVal != null) {
                      popupDialogueBox(indexVal);
                      print('Deleted Value from $indexVal');
                    } else {
                      print('ID passed is Null');
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
          itemCount: studentList.length,
        );
      },
    );
  }

  popupDialogueBox(int indexValue) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Do you want to delete this entry?"),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                onPressed: () {
                  deleteStudent(indexValue);
                  Navigator.of(context).pop();
                },
                child: const Text("YES"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("NO"),
              ),
            ],
          );
        });
  }
}
