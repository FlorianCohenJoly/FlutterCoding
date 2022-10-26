import 'package:app_flutter_coding/connexion/login_page.dart';
import 'package:app_flutter_coding/cours.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPage(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: 
            ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 33, 48, 50)
            )
        )
      )
    );
  }
}

