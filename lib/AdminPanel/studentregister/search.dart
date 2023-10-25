import 'dart:io';
import 'package:brototype_app/AdminPanel/studentregister/list_data.dart';
import 'package:brototype_app/AdminPanel/studentregister/sdtudent_profile.dart';
import 'package:brototype_app/database/functions/function/adminFunctions/register_std_function.dart';
import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends SearchDelegate {
  // first override to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          Navigator.of(context).pop();
          // query = ''
        },
      ),
    ];
  }

  //to pop out of the search menu
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // for closing the search page and going back
      },
    );
  }

//to show query result
  @override
  Widget buildResults(BuildContext context) {
    //bool output = true;
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: ((BuildContext context, List<StudentModel> studentList,
          Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            String nameVal = data.name;
            if ((nameVal).contains((query.trim()))) {
              print('matched!!!!');
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const ListStudent();
                          }),
                        ),
                      );
                    },
                    title: Text("${data.name} "),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(data.photo)),
                    ),
                  ),
                  const Divider()
                ],
              );
            } else {
              print('no result');
              //output = false;
            }
            return null;
          },
          itemCount: studentList.length,
        );
      }),
    );
  }

  //to show the querying process ie suggestions at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: ((BuildContext context, List<StudentModel> studentList,
          Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            String nameVal = data.name;
            if ((nameVal).contains((query))) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return ScreenProfile(
                                name: data.name,
                                age: data.age,
                                phone: data.phone,
                                address: data.adress,
                                index: index,
                                photo: data.photo);
                          }),
                        ),
                      );
                    },
                    title: Text("${data.name}"),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(data.photo)),
                    ),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentList.length,
        );
      }),
    );
  }
}
