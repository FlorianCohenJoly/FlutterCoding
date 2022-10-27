// ignore_for_file: prefer_const_constructors

import 'package:app_flutter_coding/bdd/display.dart';
import 'package:app_flutter_coding/bdd/mongoDBModel.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({Key? key}) : super(key: key);

  @override
  _MongoDbInsertState createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  var nameController = new TextEditingController();
  var mdpController = new TextEditingController();
  var mailController = new TextEditingController();
  var ppController = new TextEditingController();

  var _checkInsertUpdate = "Insert";

  @override
  Widget build(BuildContext context) {
    MongoDbModel data =
        ModalRoute.of(context)!.settings.arguments as MongoDbModel;

    if (data != null) {
      nameController.text = data.name;
      mdpController.text = data.mdp;
      mailController.text = data.mail;
      ppController.text = data.pp;
      _checkInsertUpdate = "Update";
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              _checkInsertUpdate,
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nom d'utilisateur",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: mdpController,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: mailController,
              decoration: InputDecoration(
                labelText: "Adresse mail",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: ppController,
              decoration: InputDecoration(
                labelText: "Photo de profil",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(
                  horizontal: 125,
                  vertical: 13,
                ),
              ),
              child: Text(
                "confirm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                if (_checkInsertUpdate == "Update") {
                  _updateData(data.id, nameController.text, mdpController.text,
                      mailController.text, ppController.text);
                } else {
                  _insertData(nameController.text, mdpController.text,
                      mailController.text, ppController.text);
                }

                child:
                Text(_checkInsertUpdate);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateData(
      var id, String name, String mdp, String mail, String pp) async {
    final updateData =
        MongoDbModel(id: id, name: name, mdp: mdp, mail: mail, pp: pp);
      await MongoDatabase.updateData(updateData)
        .whenComplete(() => Navigator.pop(context));
  }

  Future<void> _insertData(
      String name, String mdp, String mail, String pp) async {
    var _id = M.ObjectId();
    final data =
        MongoDbModel(id: _id, name: name, mdp: mdp, mail: mail, pp: pp);
    var result = await MongoDatabase.insertData(data);
  }

  Future<void> _insertDataConcours(
      String nom, String adresse, String photo, String date) async {
    var _id = M.ObjectId();
    final data =
        MongoDbModelConcours(id: _id, nom: nom, adresse: adresse, photo: photo, date: date);
    var result = await MongoDatabase.insertConcours(data);
  }
}


