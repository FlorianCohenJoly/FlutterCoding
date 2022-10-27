// ignore_for_file: prefer_const_constructors

import 'package:app_flutter_coding/bdd/insert.dart';
import 'package:app_flutter_coding/bdd/mongoDbModel.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/connexion/inscription_page.dart';
import 'package:flutter/material.dart';

class MongoDbUpdate extends StatefulWidget {
  const MongoDbUpdate({Key? key}) : super(key: key);

  @override
  _MongoDbUpdateState createState() => _MongoDbUpdateState();
}

class _MongoDbUpdateState extends State<MongoDbUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: MongoDatabase.getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return displayCard(
                          MongoDbModel.fromJson(snapshot.data[index]));
                    });
              } else {
                return Center(
                  child: Text("No data found"),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget displayCard(MongoDbModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("${data.id}"),
                SizedBox(
                  height: 5,
                ),
                Text("${data.name}"),
                SizedBox(
                  height: 5,
                ),
                Text("${data.mdp}"),
                SizedBox(
                  height: 5,
                ),
                Text("${data.mail}"),
                SizedBox(
                  height: 5,
                ),
                Text("${data.pp}"),
              ],
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return InscriptionPage();
                    },settings: RouteSettings(arguments:data)
                  )).then((value){
                    setState(() {
                      
                    });

                  });
                },
                icon: Icon(Icons.edit)),
          ],
        ),
      ),
    );
  }
}
