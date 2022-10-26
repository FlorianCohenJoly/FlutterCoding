import "package:flutter/material.dart";
import 'package:app_flutter_coding/view/drawer.dart';

class Planning extends StatefulWidget {
  const Planning({ Key? key }) : super(key: key);

  @override
  _PlanningState createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Planning',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}