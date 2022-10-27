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
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(50),
              child: ListTile(
                title: const Text("Titre"),
                leading: Icon(
                  Icons.groups_rounded,
                ),
                subtitle: const Text("Description")
              )
            )
          ],
        )
      ),
    );
  }
}