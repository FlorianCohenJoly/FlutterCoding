import 'package:app_flutter_coding/bdd/insert.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';

class ConcoursList extends StatefulWidget {
  const ConcoursList({Key? key}) : super(key: key);

  @override
  _ConcoursListState createState() => _ConcoursListState();
}

class _ConcoursListState extends State<ConcoursList> {

  final Future<String> calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {

    Future data = MongoDatabase.getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Concours"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            
          ],
        )
      )
    );
  }
}