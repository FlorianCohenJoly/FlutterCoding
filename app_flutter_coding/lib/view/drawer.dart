import 'package:flutter/material.dart';
import 'package:app_flutter_coding/view/icons.dart';

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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(MyFlutterApp.horse_head),
              title: const Text('Équitation'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(MyFlutterApp.horseshoe),
              title: const Text('Écurie'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
    );
  }
}