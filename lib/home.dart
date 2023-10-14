import 'package:flutter/material.dart';
import 'package:brototype_app/screens/menubar.dart';
import 'package:brototype_app/screens/codingchallenge.dart';
import 'package:brototype_app/screens/hubs.dart';
import 'package:brototype_app/screens/fumigation.dart';
import 'package:brototype_app/screens/aboutpage.dart';
import 'package:brototype_app/screens/stories.dart';
import 'package:brototype_app/screens/events.dart';
import 'package:brototype_app/screens/search_bar.dart';
import 'package:brototype_app/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          'Brototype',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.00,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CodinChllge(),
          ),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[300],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/codingchallenge.jpeg',
                          width: 80,
                          height: 90,
                        ),
                        Text(
                          'Coding Challenges',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HubPage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[200],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Hubs.jpeg',
                            width: 80,
                            height: 80,
                          ),
                          Text(
                            'Our Hubs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FumgnPage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Fumogation.png',
                            width: 70,
                            height: 70,
                          ),
                          Text(
                            'Fumigation',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Eventpage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/events.jpg',
                            width: 70,
                            height: 70,
                          ),
                          Text(
                            'Upcoming Events',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryPage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.brown[600],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/success.jpg',
                            width: 70,
                            height: 70,
                          ),
                          Text(
                            'Success Stories',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Aboutpage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/keepNotes.png',
                            width: 70,
                            height: 70,
                          ),
                          Text(
                            'Student Notes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                )),
          ),
        ),
      ),
    );
  }
}
