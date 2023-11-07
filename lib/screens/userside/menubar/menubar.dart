import 'package:brototype_app/screens/faqs.dart';
import 'package:brototype_app/screens/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:brototype_app/screens/loginpage.dart';
import 'package:brototype_app/screens/profile.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('Example@gmail.com'),
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
