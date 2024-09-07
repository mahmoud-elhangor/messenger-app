import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Slidable extends StatelessWidget {
  const Slidable({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width:MediaQuery.of(context).size.width*.6,
        backgroundColor: Colors.black54,
        child: ListView(
          children: [
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white ,
              leading: const Icon(Icons.home),
              title: const Text("home"),
              onTap: () {
                Navigator.pushNamed(context, "ChatPage");
              },
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white ,
              leading: const Icon(Icons.notifications_none),
              title: const Text("notifications"),
              onTap: () {     Navigator.pushNamed(context, "ChatPage");},
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white ,
              leading: const Icon(Icons.settings),
              title: const Text("settings"),
              onTap: () {    Navigator.pushNamed(context, "ChatPage");},
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white ,
              leading: const Icon(Icons.mail),
              title: const Text("mail"),
              onTap: () {
                Navigator.pushNamed(context, "ChatPage");},
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white ,
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "LoginPage");},
            ),
          ],
        ),
    );
  }
}
