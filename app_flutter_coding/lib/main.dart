import 'package:app_flutter_coding/connexion/login_page.dart';
import 'package:app_flutter_coding/view/drawer.dart';
import 'package:app_flutter_coding/view/equitation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
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
      home: Equitation(),
    );
  }
}

