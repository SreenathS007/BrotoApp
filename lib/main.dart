import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:brototype_app/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await Firebase.initializeApp();

  //student register Adapter

  if (!Hive.isAdapterRegistered(RegisterModelAdapter().typeId)) {
    Hive.registerAdapter(RegisterModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),
    );
  }
}
