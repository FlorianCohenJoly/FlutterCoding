import 'package:app_flutter_coding/view/concours.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_coding/view/drawer.dart';
import 'package:app_flutter_coding/view/cours.dart';
import 'package:app_flutter_coding/view/soiree.dart';


// make a view with the drawer and 3 buttons to navigate to the 3 views
class Equitation extends StatefulWidget {
  const Equitation({ Key? key }) : super(key: key);

  @override
  _EquitationState createState() => _EquitationState();
}

class _EquitationState extends State<Equitation> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      minimumSize: const Size(150, 50),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Equitation'),
        backgroundColor: const Color.fromARGB(255, 33, 48, 50),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cours()),
                  );
                },
                child: const Text('Cours'),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ConcoursList()),
                  );
                },
                child: const Text('Concours'),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push
                  (context,
                    MaterialPageRoute(builder: (context) => const Soiree()),
                  );
                },
                child: const Text('Soirée'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



