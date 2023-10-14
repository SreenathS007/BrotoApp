import 'package:brototype_app/custom_widgets/bottomNavbar.dart';
import 'package:brototype_app/database/functions/models/userdata_model.dart';
import 'package:flutter/material.dart';
import 'package:brototype_app/screens/loginpage.dart';
import 'package:brototype_app/home.dart';
import 'package:hive/hive.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confpass = TextEditingController();
  void registerUser(BuildContext context, email, String password) async {
    final userBox = await Hive.openBox('userBox');
    final newUser = User(email: email, password: password);
    userBox.add(newUser);
    Navigator.pop(context); // Go back to the login screen
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'SignUp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        label: Text('User Name'),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: TextField(
                      controller: _email,
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
                      controller: _pass,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        label: Text('Password'),
                        suffixIcon: Icon(Icons.visibility_off),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: TextField(
                      controller: _confpass,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        label: Text('Confirm Password'),
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
                          MaterialPageRoute(
                              builder: (context) => bottomNavBar()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff0ACF83)),
                      ),
                      child: Center(
                        child: Text(
                          'Signup',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 30),
                    child: Row(
                      children: [
                        Text(
                          "Already have account?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
