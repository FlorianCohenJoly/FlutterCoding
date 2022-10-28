import 'package:app_flutter_coding/bdd/mongoDBModelStable.dart';
import 'package:app_flutter_coding/view/drawer.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:flutter/material.dart';

class MongoDbDisplayStable extends StatefulWidget {
  const MongoDbDisplayStable({Key? key}) : super(key: key);

  @override
  _MongoDbDisplayStateStable createState() => _MongoDbDisplayStateStable();
}

class _MongoDbDisplayStateStable extends State<MongoDbDisplayStable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Écurie'),
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
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return displayCard(
                            MongoDbModelStable.fromJson(snapshot.data[index]),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("Texte non disponible"),
                    );
                  }
                }
              }),
        ),
      ),
    );
  }

  Widget displayCard(MongoDbModelStable data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
           child: ListTile(
            title: Text(data.name),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(data.name),
                    content: ListTile(
                      title: Text(data.cavalier),
                      trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                  MongoDatabase.delete(data);
                  setState(() {});
                },
              ),
                      subtitle: Text(data.horse),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
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