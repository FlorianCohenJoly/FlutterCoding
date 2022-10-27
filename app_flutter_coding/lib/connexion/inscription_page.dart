// ignore_for_file: prefer_const_constructors

import 'package:app_flutter_coding/animation/delayed_animation.dart';
import 'package:app_flutter_coding/bdd/insert.dart';

import 'package:app_flutter_coding/bdd/update.dart';
import 'package:flutter/material.dart';


class InscriptionPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 48, 50),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 33, 48, 50),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Color.fromARGB(232, 212, 161, 21),
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                    delay: 0,
                    child: Text(
                      "Créer un compte",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  DelayedAnimation(
                    delay: 0,
                    child: Text(
                      "Créer un compte pour te connecter",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            MongoDbInsert(),            
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MongoDbUpdate(),
                    ),
                  );
                  },
                  child: DelayedAnimation(
                    delay: 0,
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

