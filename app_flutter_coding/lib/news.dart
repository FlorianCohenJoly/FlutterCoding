import 'package:flutter/material.dart';



class News extends StatefulWidget {
  const News({ Key? key }) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
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