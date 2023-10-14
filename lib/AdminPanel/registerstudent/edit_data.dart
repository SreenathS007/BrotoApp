import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:brototype_app/AdminPanel/registerstudent/register_home.dart';
import 'package:brototype_app/database/functions/function/register_db_function.dart';
import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class screen_Edit extends StatefulWidget {
  final String name;
  final String age;
  final String address;
  final String phone;
  final String photo;
  final int index;

  const screen_Edit(
      {super.key,
      required this.name,
      required this.age,
      required this.phone,
      required this.address,
      required this.photo,
      required this.index});

  @override
  State<screen_Edit> createState() => _screen_EditState();
}

class _screen_EditState extends State<screen_Edit> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age);
    _phoneController = TextEditingController(text: widget.phone);
    _addressController = TextEditingController(text: widget.address);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx2) => const screenHome()));
              },
              child: const Icon(Icons.close_rounded),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const Text(
                  "Edit Student details",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    _photo?.path == null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                const Color.fromARGB(255, 13, 13, 13),
                            child: CircleAvatar(
                              radius: 48,
                              backgroundImage: FileImage(File(widget.photo)),
                            ),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Color.fromARGB(255, 13, 13, 13),
                            child: CircleAvatar(
                              radius: 48,
                              backgroundImage: FileImage(
                                File(_photo!.path),
                              ),
                            ),
                          ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 11, 11, 11),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 255, 254, 254),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt_outlined),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                getPhoto();
                              },
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Age",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Age is Required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Adress",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Adress Required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Phone Number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    } else if (value.length < 10) {
                      return "Invalid Phone number";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          updateStudentDetail(context);
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text("Save Data"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  late String photoPathValue = '';
  Future<void> updateStudentDetail(ctx) async {
    if (photoPathValue == '') photoPathValue = widget.photo;

    final studentmodel = StudentModel(
      id: DateTime.now().millisecond.toString(),
      name: _nameController.text,
      age: _ageController.text,
      phone: _phoneController.text,
      adress: _addressController.text,
      photo: photoPathValue,
    );
    await updateList(widget.index, studentmodel);

    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(30),
        backgroundColor: Colors.green,
        content: Text(
          'Saved',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  File? _photo;
  Future<void> getPhoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);

    final photoTemp = File(photo!.path);
    setState(() {
      _photo = photoTemp;
      photoPathValue = _photo!.path;
    });
  }
}
