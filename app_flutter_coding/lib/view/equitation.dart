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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equitation'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // create 3 buttons
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/equitation');
              },
              child: const Text('Equitation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dressage');
              },
              child: const Text('Dressage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/saut');
              },
              child: const Text('Saut'),
            ),
          ],
        ),
      ),
    );
  }
}

