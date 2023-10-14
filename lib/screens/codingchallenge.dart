import 'package:flutter/material.dart';

List<String> imagePaths = [
  'assets/images/cdg1.jpg',
  'assets/images/cdg2.jpg',
  'assets/images/cdg3.jpg',
  'assets/images/cdg4.jpg',
  'assets/images/cdg5.jpg',
  'assets/images/cdg6.jpg',
  'assets/images/cdg7.jpg',
  'assets/images/cdg8.jpg',
  'assets/images/cdg9.jpg',
  'assets/images/cdg10.jpg',
];

final List<String> cardTexts = [
  '100K coding Challenge',
  'Web Designing Challenge',
  'Data Structure Challenge',
  'Flutter Challenge',
  'Python Challenge',
  'React Challenge',
  '3hr Coding Challenge',
  'Git Challenge',
  'Introduction webdesign',
  'Hosting Tutorial',
];

final List<Widget> pages = [
  // Page1(),
  // Page2(),
  // Page3(),
  // page4(),
  // Page5(),
  // Page6(),
  // Page7(),
  // Page8(),
  // Page9(),
  // Page10(),
];

class CodinChllge extends StatelessWidget {
  const CodinChllge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Coding Challenge's",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: const Color.fromARGB(255, 19, 30, 36),
              elevation: 4,
              child: Row(
                children: [
                  Icon(
                    Icons.playlist_play,
                    color: Colors.white,
                    size: 40,
                  ),
                  Image.asset(
                    imagePaths[index],
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardTexts[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ListTile(
                          trailing: GestureDetector(
                            onTap: () {
                              if (index < pages.length) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => pages[index],
                                  ),
                                );
                              }
                            },
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
