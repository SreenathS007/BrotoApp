import 'package:brototype_app/screens/faqs.dart';
import 'package:brototype_app/screens/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:brototype_app/screens/loginpage.dart';

class NavBar extends StatefulWidget {
  final String userName;
  final String userEmail;

  NavBar({required this.userName, required this.userEmail, Key? key})
      : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late String userName;
  late String userEmail;
  @override
  void initState() {
    super.initState();
    userName = widget.userName;
    userEmail = widget.userEmail;
  }

  void UpdateUserInfo(String newName, String newEmail) {
    setState(() {
      userName = newName;
      userEmail = newEmail;
    });
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.userName),
            accountEmail: Text(widget.userEmail),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/coverpic.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: Text('Profile Settings'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Updateprofile(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: Text('FAQs'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FAQsPage(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('LogOut'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
