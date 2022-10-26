import 'package:flutter/material.dart';

class Concours extends StatefulWidget {
  const Concours({ Key? key }) : super(key: key);

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

  final _CoursKey = GlobalKey<FormState>();

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
              key: _CoursKey,
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
                    TextFormField(
                      controller: listeController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: "Liste des participants"
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        
                        child: ElevatedButton(
                          onPressed: () {
                            submitForm(nomController.value.text, adresseController.value.text, photoController.value.text, dateController.value.text);
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