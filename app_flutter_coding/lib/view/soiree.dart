import 'package:flutter/material.dart';



class Soiree extends StatefulWidget {
  const Soiree({ Key? key }) : super(key: key);

  @override
  _SoireeState createState() => _SoireeState();
}

class NewSoiree{
  String? theme;
  String? name;
  String? date;
  String? heure;
  String? addresse;

}

const List<String> list = <String>['Apéro', 'Repas'];

class _SoireeState extends State<Soiree> {

  void submitForm(name, date, heure, addresse){
    NewSoiree soiree = NewSoiree();
    soiree.theme = themeController;
    soiree.name = name;
    soiree.date = date;
    soiree.heure = heure;
    soiree.addresse = addresse;
    print(soiree.theme);
    print(soiree.date);
    print(soiree.heure);
    print(soiree.addresse);
  }

  final _CoursKey = GlobalKey<FormState>();

  String dropdownValue = list.first;

  String? themeController;
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final heureController = TextEditingController();
  final addresseController = TextEditingController();

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
                    child: const Text("Créer une soirée", style: TextStyle(fontSize: 32),)
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
                                      value: "apero",
                                      child: Text("Apéro")
                                  ),
                                  DropdownMenuItem(
                                      value: "repas",
                                      child: Text("Repas")
                                  )
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    themeController = value;
                                  });
                                },
                              ),
                            ),
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                  hintText: "Nom de la soirée"
                              ),
                            ),
                            TextFormField(
                              controller: dateController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                  hintText: "Date de la soirée"
                              ),
                            ),
                            TextFormField(
                              controller: heureController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                  hintText: "Heure de la soirée"
                              ),
                            ),
                            Container(
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: TextFormField(
                                  controller: addresseController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromARGB(255, 255, 255, 255),
                                      hintText: "Adresse de la soirée"
                                  ),
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Container(

                                  child: ElevatedButton(
                                    onPressed: () {
                                      submitForm(nameController.value.text, dateController.value.text, heureController.value.text, addresseController.value.text);
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