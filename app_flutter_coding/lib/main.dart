import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/body_page.dart';
import 'package:app_flutter_coding/connexion/login_page.dart';
import 'package:app_flutter_coding/view/cours.dart';
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

