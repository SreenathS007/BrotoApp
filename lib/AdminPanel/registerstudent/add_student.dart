import 'dart:io';
import 'package:brototype_app/database/functions/function/register_db_function.dart';
import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:brototype_app/AdminPanel/registerstudent/register_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class ScreenAdd extends StatefulWidget {
  const ScreenAdd({super.key});

  @override
  State<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Student"),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => screenHome(),
                ));
              },
              child: const Icon(Icons.home_outlined),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    _photo?.path == null
                        ? const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                              radius: 57,
                              backgroundImage:
                                  AssetImage('assets/images/studentAvtr.png'),
                            ),
                          )
                        : CircleAvatar(
                            radius: 60,
                            child: CircleAvatar(
                              radius: 58,
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
                            color: Color.fromARGB(255, 14, 14, 14),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt_outlined),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                getPhoto();
                              },
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is Required';
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
                    hintText: 'Enter Age',
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
                  controller: _adressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Address",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Adress Required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Phone Number Required",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Invalid Phone Number";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _photo != null) {
                      addStudentToModel();
                    } else if (_photo == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Please Add profile image!',
                            style: TextStyle(color: Colors.white),
                          )));
                    } else {
                      print('Empty Field found..!!');
                    }
                  },
                  child: const Text('Add Student'),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  popDialogueBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Success"),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (ctx) {
                      return const screenHome();
                    }));
                  },
                  child: const Text("Back")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add New")),
            ],
            content: const Text("Saved SuccessFully"),
          );
        });
  }

  Future<void> addStudentToModel() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _phone = _phoneController.text.trim();
    final _address = _adressController.text.trim();
    final _image = _photo;

    if (_photo!.path.isEmpty ||
        _name.isEmpty ||
        _phone.isEmpty ||
        _age.isEmpty ||
        _address.isEmpty) {
      return;
    } else {
      _nameController.text = '';
      _ageController.text = '';
      _phoneController.text = '';
      _adressController.text = '';
      _photo = null;

      setState(() {
        popDialogueBox();
      });
    }
    final studentObject = StudentModel(
        name: _name,
        age: _age,
        phone: _phone,
        adress: _address,
        photo: _image!.path,
        id: DateTime.now().millisecond.toString());
    print("$_name $_age $_address $_phone");
    addStudent(studentObject);
  }

  File? _photo;
  Future<void> getPhoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
    } else {
      final photoTemp = File(photo.path);
      setState(() {
        _photo = photoTemp;
      });
    }
  }
}
