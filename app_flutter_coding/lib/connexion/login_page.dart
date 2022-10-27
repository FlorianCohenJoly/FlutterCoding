import 'package:app_flutter_coding/animation/delayed_animation.dart';
import 'package:app_flutter_coding/body_page.dart';
import 'package:app_flutter_coding/connexion/inscription_page.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/bdd/mongoDBModel.dart';

import '../view/equitation.dart';



// make a login page who check if the user is in the database and if the password is correct

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Color.fromARGB(255, 33, 48, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            essai(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DelayedAnimation(
                  delay: 1000,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Veuillez entrer votre email";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: "Mot de passe",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Veuillez entrer votre mot de passe";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 1500,
                  child: ElevatedButton(
                    onPressed: () async {

                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Equitation(),
                            ),
                          );
                        } else {
                          "Veuillez vérifier vos identifiants";

                        }
                      }
                    },
                    child: Text("Se connecter"),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 33, 48, 50),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 2000,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InscriptionPage(),
                        ),
                      );
                    },
                    child: Text("S'inscrire"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}