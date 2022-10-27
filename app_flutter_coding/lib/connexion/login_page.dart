import 'package:app_flutter_coding/animation/delayed_animation.dart';
import 'package:app_flutter_coding/body_page.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {

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
                "Connecte toi avec ton nom d'utilisateur",
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
                "Connecte toi pour pouvoir accéder à l'application. De plus, il est recommandé de te  connecter avec ton adresse e-mail pour mieux protéger tes informations.",
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
      SizedBox(height: 35),
      LoginForm(),
      SizedBox(height: 125),
      DelayedAnimation(
        delay: 0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(
              horizontal: 125,
              vertical: 13,
            ),
          ),
          child: Text(
            'CONFIRM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Body(),
              ),
            );
          },
        ),
      ),
      SizedBox(height: 90),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 35),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
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



class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 0,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Ton nom d'utilisateur",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 0,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}