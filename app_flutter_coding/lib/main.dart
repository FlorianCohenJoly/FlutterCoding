import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/body_page.dart';
import 'package:app_flutter_coding/connexion/inscription_page.dart';
import 'package:app_flutter_coding/connexion/login_page.dart';
import 'package:app_flutter_coding/view/drawer.dart';
import 'package:app_flutter_coding/view/ecurie.dart';
import 'package:app_flutter_coding/view/equitation.dart';
import 'package:app_flutter_coding/view/cours.dart';
import 'package:app_flutter_coding/view/concours.dart';
import 'package:app_flutter_coding/view/actu.dart';
import 'package:app_flutter_coding/view/concoursForm.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  await initializeDateFormatting();

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
      home: Scaffold(body: Body(),),
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

