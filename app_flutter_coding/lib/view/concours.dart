import 'package:app_flutter_coding/bdd/insert.dart';
import 'package:app_flutter_coding/bdd/mongoDBModel.dart';
import 'package:app_flutter_coding/view/concoursForm.dart';
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
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Concours(title: "Creer un concours")));
                },
                child: Text(''),
        ),
            ]
        ),
        body: Container(
            child: FutureBuilder(
                future: MongoDatabase.getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator()
                );
              }
              else{
                if(snapshot.hasData){
                  var totalData = snapshot.data.length;
                  print("Données totale" + totalData.toString());
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return displayCard(MongoDbModelConcours.fromJson(snapshot.data[index]));
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
      )
    );
  }

  Widget displayCard(MongoDbModelConcours data){
    return Center(child: Card(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${data.nom}'),
            SizedBox(height: 5),
            Text('${data.adresse}'),
            SizedBox(height: 5),
            Text('${data.date}'),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Participer')
            ),
          ]
      ),
    ),
    );
  }
}