import 'package:app_flutter_coding/body_page.dart';
import 'package:app_flutter_coding/view/concours.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_coding/bdd/mongoDBModel.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/bdd/insert.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class Concours extends StatefulWidget {
  const Concours({ Key? key, required String title }) : super(key: key);

  @override
  _ConcoursState createState() => _ConcoursState();
}

class NewConcours{
  String? nom;
  String? adresse;
  String? photo;
  String? date;
  List? liste;
}

class _ConcoursState extends State<Concours> {

  void submitForm(nom, adresse, photo, date){
    NewConcours concours = NewConcours();
    concours.nom = nom;
    concours.adresse = adresse;
    concours.photo = photo;
    concours.date = date;
  }

  final _ConcoursKey = GlobalKey<FormState>();

  final nomController = TextEditingController();
  final adresseController = TextEditingController();
  final photoController = TextEditingController();
  final dateController = TextEditingController();
  final listeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 48, 50),
        title: const Text("Concours"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: const Text("Ajouter un concours", style: TextStyle(fontSize: 32),)
            ),
            Form(
              key: _ConcoursKey,
              child: SizedBox(
                width: 400,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nomController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: "Nom du concours"
                      ),
                      
                    ),
                    TextFormField(
                      controller: adresseController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: "Lieu du concours"
                      ),
                    ),
                    TextFormField(
                      controller: photoController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: "Insérez votre photo"
                      ),
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: "Date du concours"
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        
                        child: ElevatedButton(
                          onPressed: () {
                            _insertData(nomController.value.text, dateController.value.text, adresseController.value.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConcoursList(),
                              ),
                            );
                          },
                          child: const Text('Submit'),
                        ),
                      )
                    )
                  ],
                )
              )
            )
          ],
        )
      )
    );
  }
}

Future<void> _insertData(String nom, String date, String adresse) async {

  var _id = M.ObjectId();
  final data = MongoDbModelConcours(id: _id, nom: nom, date: date, adresse: adresse);
  var result  = await MongoDatabase.insertConcours(data);

  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("insert"+_id.$oid)));
}