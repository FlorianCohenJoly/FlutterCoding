import 'package:app_flutter_coding/bdd/mongoDBModelSoiree.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/bdd/mongoDBModel.dart';


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
      body: Center(
        child: FutureBuilder(
          future: MongoDatabase.getDataConcours(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator()
              );
            }
            else{
              if(snapshot.hasData){
                return FutureBuilder(
                  future: MongoDatabase.getDataCours(),
                  builder: (context, AsyncSnapshot snapshot2) {
                    if(snapshot2.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator()
                      );
                    }
                    else{
                      if(snapshot2.hasData){
                        return FutureBuilder(
                          future: MongoDatabase.getDataSoiree(),
                          builder: (context, AsyncSnapshot snapshot3) {
                            if(snapshot3.connectionState == ConnectionState.waiting){
                              return Center(
                                child: CircularProgressIndicator()
                              );
                            }
                            else{
                              if(snapshot.hasData){
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return displayCard(MongoDbModelConcours.fromJson(snapshot.data[index]), MongoDbModelCours.fromJson(snapshot2.data[index]), MongoDbModelSoiree.fromJson(snapshot3.data[index]));
                                  }
                                );
                              }
                              else{
                                return Text("Pas de résultat");
                              }
                            }
                          }
                        );
                      }
                      else{
                        return Text("Pas de résultat");
                      }
                    }
                  }
                );  
              }
              else{
                return Center(
                  child: Text("Pas de donnée disponible"),
                );
              }
            }
          }
        )
      ),
    );
  }

  Widget displayCard(MongoDbModelConcours data, MongoDbModelCours data2, MongoDbModelSoiree data3){
    return Column(children: [
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${data.nom}'),
            Text('${data.adresse}'),
            Text('${data.date}')
          ]
        ),
      ),
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${data2.terrain}'),
            Text('${data2.date}'),
            Text('${data2.heure}'),
            Text('${data2.duree}'),
            Text('${data2.discipline}')
          ]
        ),
      ),
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${data3.theme}'),
            Text('${data3.name}'),
            Text('${data3.date}'),
            Text('${data3.heure}'),
            Text('${data3.adresse}')
          ]
        ),
      ),
    ]
    );
  }
}