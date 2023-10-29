import 'package:brototype_app/custom_widgets/bottomNavbar.dart';
import 'package:brototype_app/database/functions/function/userFunctions/signup_function.dart';
import 'package:brototype_app/database/functions/models/adminmodel/register_model.dart';
import 'package:brototype_app/database/functions/models/adminmodel/video_add_model.dart';
import 'package:brototype_app/database/functions/models/signup_model.dart';
import 'package:brototype_app/screens/splash.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const savekeyName = 'UserLoggedIn';
const emailkeyName = 'userEmailKey';
ValueNotifier<String> imgPath = ValueNotifier('');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await Firebase.initializeApp();

  //student register Adapter

  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  if (!Hive.isAdapterRegistered(VideoModelAdapter().typeId)) {
    Hive.registerAdapter(VideoModelAdapter());
  }

  //signup user model
  if (!Hive.isAdapterRegistered(UserdataModalAdapter().typeId)) {
    Hive.registerAdapter(UserdataModalAdapter());
  }
  await getUserImg();
  HiveDb db = HiveDb();

  Box userBox = await Hive.openBox(db.userBoxKey);

  final sharedPrefs = await SharedPreferences.getInstance();

  String? email = sharedPrefs.getString(emailkeyName);

  UserdataModal user = await userBox.get(email);
  user_name = user.username;
  user_email = user.email;
  user_password = user.phone;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      //     useMaterial3: true),
      home: ScreenSplash(),
    );
  }
}
