import 'dart:io';
import 'package:brototype_app/custom_widgets/bottomNavbar.dart';
import 'package:brototype_app/main.dart';
import 'package:brototype_app/screens/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int selectedRadio;

  @override
  void initState() {
    selectedRadio = 0;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    IconButton(
                        onPressed: () => Get.to(() => const Updateprofile()),
                        icon: const Icon(Icons.edit))
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ValueListenableBuilder(
                    valueListenable: imgPath,
                    builder: (BuildContext context, file, _) {
                      return imgPath.value.isEmpty
                          ? Image.asset(
                              'assets/images/stdprofile.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(file),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            );
                    },
                  )),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(right: 230),
                child: Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          user_name,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        user_email,
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.only(right: 230),
                child: Text(
                  'Phone',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          user_password,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}









// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   String _selectedGender = 'Male';
//   final TextEditingController _placeController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('User Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: getImage,
//                   child: CircleAvatar(
//                     radius: 55,
//                     backgroundColor: Colors.grey,
//                     backgroundImage: _image != null ? FileImage(_image!) : null,
//                     child: _image == null
//                         ? const Icon(
//                             Icons.camera_alt,
//                             color: Colors.white,
//                           )
//                         : null,
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: _ageController,
//                   decoration: const InputDecoration(labelText: 'Age'),
//                   keyboardType: TextInputType.number,
//                   maxLength: 2,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your age';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 Text('Select Gender:'),
//                 Row(
//                   children: [
//                     Radio<String>(
//                       value: 'Male',
//                       groupValue: _selectedGender,
//                       onChanged: (String? value) {
//                         setState(() {
//                           _selectedGender = value!;
//                         });
//                       },
//                     ),
//                     const Text('Male'),
//                     Radio<String>(
//                       value: 'Female',
//                       groupValue: _selectedGender,
//                       onChanged: (String? value) {
//                         setState(() {
//                           _selectedGender = value!;
//                         });
//                       },
//                     ),
//                     const Text('Female'),
//                     Radio<String>(
//                       value: 'Others',
//                       groupValue: _selectedGender,
//                       onChanged: (String? value) {
//                         setState(() {
//                           _selectedGender = value!;
//                         });
//                       },
//                     ),
//                     const Text('Others'),
//                   ],
//                 ),
//                 TextFormField(
//                   controller: _placeController,
//                   decoration: const InputDecoration(labelText: 'Place'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your place';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(labelText: 'Email'),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     if (!value.contains('@')) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(labelText: 'Phone Number'),
//                   keyboardType: TextInputType.phone,
//                   maxLength: 10,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your phone number';
//                     }
//                     if (value.length != 10) {
//                       return 'Please enter a 10 digit phone number';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Save the data here
//                       _saveData();
//                     }
//                   },
//                   child: const Text('Save'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _saveData() {
//     // Save the data to the database or storage
//     String name = _nameController.text;
//     String age = _ageController.text;
//     String gender = _selectedGender;
//     String place = _placeController.text;
//     String email = _emailController.text;
//     String phoneNumber = _phoneController.text;

//     // Example saving action
//     print('Saving Data...');
//     print('Name: $name');
//     print('Age: $age');
//     print('Gender: $gender');
//     print('Place: $place');
//     print('Email: $email');
//     print('Phone Number: $phoneNumber');
//   }

//   Future<void> getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
// }
