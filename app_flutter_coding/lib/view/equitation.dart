import 'package:flutter/material.dart';
import 'package:app_flutter_coding/view/drawer.dart';


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
                  Navigator.pushNamed(context, '/equitation');
                },
                child: const Text('Equitation'),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '/concours');
                },
                child: const Text('Concours'),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '/profil');
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



