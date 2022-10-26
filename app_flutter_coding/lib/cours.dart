import 'package:flutter/material.dart';



class Cours extends StatefulWidget {
  const Cours({ Key? key }) : super(key: key);

  @override
  _CoursState createState() => _CoursState();
}

const List<String> list = <String>['Carrière', 'Manège'];

class _CoursState extends State<Cours> {

  final _CoursKey = GlobalKey<FormState>();

  String dropdownValue = list.first;

  String? terrainController;
  final dateController = TextEditingController();
  final heureController = TextEditingController();
  String? disciplineController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cours"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Ajouter un cours"),
            Form(
              key: _CoursKey,
              child: Column(
                children: [
                  DropdownButtonFormField(
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
                        print(terrainController);
                      });
                    },
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: "Date du cours"
                    ),
                    
                  ),
                  TextFormField(
                    controller: heureController,
                    decoration: InputDecoration(
                      hintText: "Heure du cours"
                    ),
                  ),
                  DropdownButtonFormField(
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
                  ),
                ],
              )
            )
          ],
        )
      )
    );
  }
}