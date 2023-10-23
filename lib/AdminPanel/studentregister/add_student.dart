import 'dart:io';
import 'package:brototype_app/AdminPanel/studentregister/register.dart';
import 'package:brototype_app/database/functions/function/adminFunctions/register_std_function.dart';
import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class screenAdd extends StatefulWidget {
  const screenAdd({super.key});

  @override
  State<screenAdd> createState() => _screenAddState();
}

class _screenAddState extends State<screenAdd> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Student'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx2) => student_register()));
              },
              child: const Icon(Icons.home_outlined),
            ),
          )
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
                                backgroundImage: AssetImage(
                                    'assets/images/StudentAvatar.jpg'),
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
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
                        return 'Age is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Address is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Phone number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Number is required';
                      } else if (value.length < 10) {
                        return 'Invalid phone number!!!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _photo != null) {
                          addStudentToModel();
                        } else if (_photo == null) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Please add Profile image!!",
                                    style: TextStyle(color: Colors.white),
                                  )));
                        } else {
                          print("Empty Filed found");
                        }
                      },
                      child: const Text("Add Student")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
//show success messah=gr function

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
                      return const student_register();
                    }));
                  },
                  child: const Text("Back")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add New")),
            ],
            content: const Text("Saved Successfully"),
          );
        });
  }

//addStudentToModel
  Future<void> addStudentToModel() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _phone = _phoneController.text.trim();
    final _address = _addressController.text.trim();
    final _image = _photo;

    if (_photo!.path.isEmpty ||
        _name.isEmpty ||
        _phone.isEmpty ||
        _age.isEmpty ||
        _address.isEmpty) {
      return;
    } else {
      //reset fields

      _nameController.text = '';
      _ageController.text = '';
      _phoneController.text = '';
      _addressController.text = '';
      _photo = null;
      setState(() {
        popDialogueBox(); //used this function for show succes message
      });
    }

    final studentObject = RegisterModel(
        name: _name,
        age: _age,
        phone: _phone,
        address: _address,
        photo: _image!.path,
        id: DateTime.now().microsecond.toString());
    print("$_name$_age$_address$_phone");

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
