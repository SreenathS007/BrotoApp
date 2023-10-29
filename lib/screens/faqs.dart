import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class FAQsPage extends StatelessWidget {
  const FAQsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 72, 119, 75),
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          leadingWidth: 20,
          title: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/FAQsIcon.jpg',
                    height: 45,
                    width: 45,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Brototype FAQS',
                        style: TextStyle(fontSize: 19),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'online',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/wtsppBGnd.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 80),
            child: Column(
              children: [
                ChatSample(),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(bottom: 80),
                  padding: EdgeInsets.all(8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 80),
          child: Container(
            child: ClipPath(
              clipper: UpperNipMessageClipperTwo(MessageType.receive),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 25, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  "Who is Brocamp for?",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 20, left: 80, bottom: 15),
          child: Container(
            child: ClipPath(
              clipper: UpperNipMessageClipperTwo(MessageType.send),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFE4FDCA),
                ),
                child: Text(
                  "Anyone who wants to learn Computer programming and build a good career as a software Engineer",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
