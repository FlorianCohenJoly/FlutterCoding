import 'package:app_flutter_coding/bdd/mongoDBModel.dart';
import 'package:app_flutter_coding/bdd/mongoDBModelSoiree.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:flutter/material.dart';



class Actualite extends StatefulWidget {
  const Actualite({ Key? key }) : super(key: key);

  @override
  _ActualiteState createState() => _ActualiteState();
}

class _ActualiteState extends State<Actualite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actualités"),
        backgroundColor: const Color.fromARGB(255, 33, 48, 50),
      ),
      body: Container(
        height: 5000,
        width: 1000,
        child: Column(
        children: [
          Text("Concours:", style: TextStyle(fontSize: 32)),
          FutureBuilder(
              future: MongoDatabase.getDataConcours(),
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
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return displayCardConcours(
                          MongoDbModelConcours.fromJson(snapshot.data[index]),
                        );
                      }
                    );
                  } 
                  else {
                    return Center(
                      child: Text("Texte non disponible"),
                    );
                  }
                }
              }
            ),
            Text("Cours:", style: TextStyle(fontSize: 32)),
            FutureBuilder(
              future: MongoDatabase.getDataCours(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    var totalData = snapshot.data.length;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return displayCardCours(
                          MongoDbModelCours.fromJson(snapshot.data[index]),
                        );
                      }
                    );
                  } 
                  else {
                    return Center(
                      child: Text("Texte non disponible"),
                    );
                  }
                }
              }
            ),
            Text("Soirée:", style: TextStyle(fontSize: 32)),
            FutureBuilder(
              future: MongoDatabase.getDataSoiree(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    var totalData = snapshot.data.length;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return displayCardSoiree(
                          MongoDbModelSoiree.fromJson(snapshot.data[index]),
                        );
                      }
                    );
                  } 
                  else {
                    return Center(
                      child: Text("Texte non disponible"),
                    );
                  }
                }
              }
            ),
          ]
        )
      )
    );
  }

  Widget displayCardConcours(MongoDbModelConcours data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
           child: ListTile(
            title: Text(data.nom),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(data.nom),
                    content: Text(
                        "Nom: ${data.nom} \nAdresse: ${data.adresse} \nDate: ${data.date}"),
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

  Widget displayCardCours(MongoDbModelCours data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
           child: ListTile(
            title: Text("${data.discipline} ${data.date}"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(data.discipline),
                    content: Text(
                        "Terrain: ${data.terrain} \nDate: ${data.date} \nHeure: ${data.heure} \nDurée: ${data.duree} \nDiscipline: ${data.discipline}"),
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

  Widget displayCardSoiree(MongoDbModelSoiree data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
           child: ListTile(
            title: Text("${data.name}"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(data.name),
                    content: Text(
                        "Theme: ${data.theme} \nNom: ${data.name} \nDate: ${data.date} \nHeure: ${data.heure} \nAdresse: ${data.adresse}"),
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