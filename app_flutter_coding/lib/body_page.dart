import 'package:app_flutter_coding/animation/delayed_animation.dart';
import 'package:app_flutter_coding/connexion/inscription_page.dart';
import 'package:app_flutter_coding/connexion/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text("Connecte toi"),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 125,
                      vertical: 10,
                    ),
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Text(
                "ou",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              DelayedAnimation(
                delay: 1000,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignForm(),
                      ),
                    );
                  },
                  child: Text("Créer un compte"),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 105,
                      vertical: 10,
                    ),
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class essai extends StatelessWidget {
  const essai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Lottie.network(
          "https://assets7.lottiefiles.com/packages/lf20_Dpi26A.json",
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
