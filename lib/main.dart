import 'package:brototype_app/database/functions/function/userdb_function.dart';
import 'package:brototype_app/database/functions/models/adminmodel/admin_model.dart';
import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:brototype_app/database/functions/models/adminmodel/video_model.dart';
import 'package:brototype_app/database/functions/models/userdata_model.dart';
import 'package:flutter/material.dart';
import 'package:brototype_app/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:brototype_app/AdminPanel/adminhome.dart';
import 'package:brototype_app/AdminPanel/adminlogin.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(VideoAdapter().typeId)) {
    Hive.registerAdapter(VideoAdapter());
  }

  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }

// this for student register data storing
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await retrieveVideos();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),
    );
  }
}
