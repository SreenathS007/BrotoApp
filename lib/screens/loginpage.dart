// import 'package:firebase_core/firebase_core.dart';
import 'package:brototype_app/custom_widgets/bottomNavbar.dart';
import 'package:brototype_app/AdminPanel/adminlogin.dart';
import 'package:flutter/material.dart';
import 'package:brototype_app/home.dart';
import 'package:brototype_app/screens/signupage.dart';
import 'package:hive/hive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void loginUser(BuildContext context, String email, String password) async {
    final userBox = await Hive.openBox('userBox');
    final user = userBox.values.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => null,
    );
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      print('invalid data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: AssetImage('assets/images/logimg.png'),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.5)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email Adress',
                      label: Text('Email Adress'),
                      fillColor: Color(0xffD8D8DD),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      label: Text('Password'),
                      suffixIcon: Icon(Icons.visibility_off),
                      fillColor: Color(0xffD8D8DD),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Color(0xff0ACF83),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bottomNavBar()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff0ACF83)),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0, top: 30),
                  child: Row(
                    children: [
                      Text(
                        "Don't have any account?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        ),
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0, top: 30),
                  child: Row(
                    children: [
                      Text(
                        "Go for Admin Account ?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminLogin(),
                          ),
                        ),
                        child: Text(
                          "Admin Login",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
