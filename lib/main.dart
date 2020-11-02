import 'package:appford/Screens/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _init = Firebase.initializeApp();

    return FutureBuilder(
        future: _init,
        builder: (ctx, appSnapshot) {
          return MaterialApp(
            title: 'Future Manual',
            theme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: LoginPage(),
          );
        });
  }
}
