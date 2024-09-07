import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/firebase_options.dart';
import 'package:messaging_app/view/SignUpPage.dart';
import 'package:messaging_app/view/chat_page.dart';
import 'package:messaging_app/view/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const Messaging(),
  );
}

class Messaging extends StatelessWidget {
  const Messaging({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger',
      routes: {
        LoginPage.routeName: (c) => const LoginPage(),
        SignUpPage.routeName: (c) => const SignUpPage(),
        ChatPage.routeName: (c) => ChatPage()
      },
      initialRoute: LoginPage.routeName,
    );
  }
}
