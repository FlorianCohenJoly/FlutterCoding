import 'package:app_flutter_coding/view/actu.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_coding/view/icons.dart';
import 'package:app_flutter_coding/view/planning.dart';
import 'package:app_flutter_coding/view/equitation.dart';
import 'package:app_flutter_coding/view/ecurie.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer (
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 64.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(''),
            ),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
              ),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.article,
              ),
              title: const Text('Actualités'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Actualite()));
              },
            ),
            ListTile(
              leading: const Icon(MyFlutterApp.horse_head),
              title: const Text('Équitation'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Equitation()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.calendar_today,
              ),
              title: const Text('Planning'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TableComplexExample()));
              },
            ),
            ListTile(
              leading: const Icon(MyFlutterApp.horseshoe),
              title: const Text('Écurie'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Ecurie()));
              },
            ),
            const AboutListTile(
              icon: Icon(
                Icons.info,
              ),
              applicationName: 'Equitation',
              applicationVersion: '1.0.0',
              applicationIcon: Icon(MyFlutterApp.horse_head),
              applicationLegalese: '© 2021',
              aboutBoxChildren: [
                Text(''),
              ],
            ),
               ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text('Déconnexion'),
                onTap: () {
                  Navigator.pop(context);
                },
            ),
          ],
        ),
    );
  }
}