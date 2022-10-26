import 'package:app_flutter_coding/connexion/login_page.dart';
import 'package:flutter/material.dart';



class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text("C'est partie"),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Colors.green.shade400,
                            textStyle: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
    );
  }
}