// import 'package:brototype_app/AdminPanel/codingvideo/video_list.dart';
// import 'package:brototype_app/database/functions/function/adminFunctions/videoAdd_function.dart';
// import 'package:brototype_app/database/functions/models/adminmodel/video_add_model.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class AddVideos extends StatefulWidget {
//   @override
//   State<AddVideos> createState() => _AddVideosState();
// }

// class _AddVideosState extends State<AddVideos> {



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Add Videos"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SafeArea(
//               child: Center(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                       controller: titleController,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           hintText: "Add Title"),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Enter Title";
//                         }
//                       }),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                       controller: linkController,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           hintText: "Add link"),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Enter Link";
//                         }
//                       }),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           addVideo(VideoModel(
//                               title: titleController.text,
//                               link: linkController.text,
//                               id: DateTime.now()
//                                   .millisecondsSinceEpoch
//                                   .toString()));
//                         }
//                         setState(() {
//                           linkController.clear();
//                           titleController.clear();
//                         });
//                       },
//                       child: Text('Add Link')),
                 
//                 ],
//               ),
//             ),
//           )),
//         ));
//   }
// }
