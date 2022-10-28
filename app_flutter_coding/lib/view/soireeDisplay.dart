import 'package:app_flutter_coding/bdd/mongoDBModelSoiree.dart';
import 'package:app_flutter_coding/view/drawer.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:flutter/material.dart';

class MongoDbDisplaySoiree extends StatefulWidget {
  const MongoDbDisplaySoiree({Key? key}) : super(key: key);

  @override
  _MongoDbDisplaySoiree createState() => _MongoDbDisplaySoiree();
}

class _MongoDbDisplaySoiree extends State<MongoDbDisplaySoiree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soirée'),
        backgroundColor: const Color.fromARGB(255, 33, 48, 50),
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
              future: MongoDatabase.getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    var totalData = snapshot.data.length;
                    print("total data" + totalData.toString());
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return displayCard(
                            MongoDbModelSoiree.fromJson(snapshot.data[index]),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("Text no available"),
                    );
                  }
                }
              }),
        ),
      ),
    );
  }

  Widget displayCard(MongoDbModelSoiree data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(data.name),
          subtitle: Text(data.theme),
          trailing: Text(data.date),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(data.name),
                  content: Text(data.date + " " + data.heure + " " + data.adresse),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}