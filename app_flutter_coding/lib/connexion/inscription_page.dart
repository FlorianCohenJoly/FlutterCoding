// ignore_for_file: prefer_const_constructors

import 'package:app_flutter_coding/animation/delayed_animation.dart';
import 'package:app_flutter_coding/bdd/mongoDBModel.dart';
import 'package:app_flutter_coding/bdd/mongoDBModelStable.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/body_page.dart';
import 'package:app_flutter_coding/bdd/insert.dart';

import 'package:app_flutter_coding/bdd/update.dart';
import 'package:flutter/material.dart';


class InscriptionPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 48, 50),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 33, 48, 50),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Color.fromARGB(232, 212, 161, 21),
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                    delay: 0,
                    child: Text(
                      "Créer un compte",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  DelayedAnimation(
                    delay: 0,
                    child: Text(
                      "Créer un compte pour te connecter",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            MongoDbInsert(),            
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MongoDbUpdate(),
                    ),
                  );
                  },
                  child: DelayedAnimation(
                    delay: 0,
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InscriptForm extends StatefulWidget {
  const InscriptForm({Key? key}) : super(key: key);

  @override
  _InscriptFormState createState() => _InscriptFormState();
}

class _InscriptFormState extends State<InscriptForm> {
  var nameController = new TextEditingController();
  var mdpController = new TextEditingController();
  var emailController = new TextEditingController();
  var ppController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test')
      ),
      body: Column(
        children: [
          DelayedAnimation(
            delay: 0,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nom d'utilisateur",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 0,
            child: TextField(
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
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 0,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Adresse @mail",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 0,
            child: TextField(
              controller: ppController,
              decoration: InputDecoration(
                labelText: "Photo de profil",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          DelayedAnimation(
              delay: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  _insertData(nameController.text,mdpController.text,emailController.text,ppController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Body(),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}


Future<void> _insertData(String name, String mdp, String email, String pp) async {

  var _id = M.ObjectId();
  final data = MongoDbModel(id: _id, name: name, mdp: mdp, mail: email, pp: pp);
  var result  = await MongoDatabase.insertData(data);

  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("insert"+_id.$oid)));



}
