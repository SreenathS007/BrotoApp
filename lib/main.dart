import 'package:brototype_app/screens/splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // if (!Hive.isAdapterRegistered(HubModelAdapter().typeId)) {
  //   Hive.registerAdapter(HubModelAdapter());
  // }
  // // this adapter for video adding
  // if (!Hive.isAdapterRegistered(VideoLinkAdapter().typeId)) {
  //   Hive.registerAdapter(VideoLinkAdapter());
  // }

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
