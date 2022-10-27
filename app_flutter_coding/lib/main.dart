import 'package:app_flutter_coding/bdd/display.dart';
import 'package:app_flutter_coding/bdd/insert.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/bdd/update.dart';
import 'package:app_flutter_coding/body_page.dart';
import 'package:app_flutter_coding/connexion/inscription_page.dart';
import 'package:app_flutter_coding/connexion/login_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Body(),
      ),
    );
  }
}
