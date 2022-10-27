import 'package:flutter/material.dart';



class Cours extends StatefulWidget {
  const Cours({ Key? key }) : super(key: key);

  @override
  _CoursState createState() => _CoursState();
}

class NewCours{
  String? terrain;
  String? date;
  String? heure;
  String? discipline;

}

const List<String> list = <String>['Carrière', 'Manège'];

class _CoursState extends State<Cours> {

  void submitForm(date, heure){
    NewCours cours = NewCours();
    cours.terrain = terrainController;
    cours.date = date;
    cours.heure = heure;
    cours.discipline = disciplineController;
    print(cours.terrain);
    print(cours.date);
    print(cours.heure);
    print(cours.discipline);
}

  final _CoursKey = GlobalKey<FormState>();

  String dropdownValue = list.first;

  String? terrainController;
  final dateController = TextEditingController();
  final heureController = TextEditingController();
  String? disciplineController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 48, 50),
        title: const Text("Cours"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: const Text("Ajouter un cours", style: TextStyle(fontSize: 32),)
            ),
            Form(
              key: _CoursKey,
              child: SizedBox(
                width: 400,
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: DropdownButtonFormField(
                        dropdownColor: Colors.grey[100],
                        items: const [
                          DropdownMenuItem(
                            value: "carriere",
                            child: Text("Carrière")
                          ),
                          DropdownMenuItem(
                            value: "manege",
                            child: Text("Manège")
                          )
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            terrainController = value;
                          });
                        },
                      ),
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: "Date du cours"
                      ),
                      
                    ),
                    TextFormField(
                      controller: heureController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: "Heure du cours"
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                            value: "dressage",
                            child: Text("Dressage")
                          ),
                          DropdownMenuItem(
                            value: "saut",
                            child: Text("Saut d'obstacles")
                          ),
                          DropdownMenuItem(
                            value: "endurance",
                            child: Text("Endurance")
                          )
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            disciplineController = value;
                            print(disciplineController);
                          });
                        },
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        
                        child: ElevatedButton(
                          onPressed: () {
                            submitForm(dateController.value.text, heureController.value.text);
                          },
                          child: const Text('Créer'),
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