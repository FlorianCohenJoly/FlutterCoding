// import 'dart:js';

import 'package:app_flutter_coding/animation/delayed_animation.dart';
import 'package:app_flutter_coding/bdd/constant.dart';
import 'package:app_flutter_coding/bdd/display.dart';
import 'package:app_flutter_coding/bdd/mongoDBModel.dart';
import 'package:app_flutter_coding/bdd/mongodb.dart';
import 'package:app_flutter_coding/body_page.dart';
import 'package:app_flutter_coding/bdd/insert.dart';
import 'package:app_flutter_coding/bdd/update.dart';
import 'package:app_flutter_coding/view/equitation.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;


class InscriptionPage extends StatelessWidget {
  var nameController = new TextEditingController();
   var mdpController = new TextEditingController();
   var mailController = new TextEditingController();
   var ppController = new TextEditingController();
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
                "Inscrivez vous avec votre adresse email",
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
                "Il est recommandé de vous connecter avec votre adresse e-mail pour mieux protéger vos informations.",
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
      SignForm(),
      SizedBox(height: 125),
      // DelayedAnimation(
      //   delay: 0,
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       shape: StadiumBorder(),
      //       padding: EdgeInsets.symmetric(
      //         horizontal: 125,
      //         vertical: 13,
      //       ),
      //     ),
      //     child: Text(
      //       'CONFIRM',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 15,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //     onPressed: () {
      //             _insertData(nameController.text,mdpController.text,mailController.text,ppController.text);
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => Body(),
      //               ),
      //             );
      //           },
      //   ),
      // ),
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

// class InscriptForm extends StatefulWidget {
//   const InscriptForm({Key? key}) : super(key: key);

//   @override
//   _InscriptFormState createState() => _InscriptFormState();
// }

// class _InscriptFormState extends State<InscriptForm> {
//   var nameController = new TextEditingController();
//   var mdpController = new TextEditingController();
//   var emailController = new TextEditingController();
//   var ppController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Test')),
//       body: Column(
//         children: [
//           DelayedAnimation(
//             delay: 0,
//             child: TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: "Nom d'utilisateur",
//                 hintText: "Nom",
                
//               ),
//             ),
//           ),
//           SizedBox(height: 30),
//           DelayedAnimation(
//             delay: 0,
//             child: TextField(
//               controller: mdpController,
//               decoration: InputDecoration(
//                 labelStyle: TextStyle(
//                   color: Colors.white,
//                 ),
//                 labelText: 'Mot de passe',
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     Icons.visibility,
//                     color: Colors.black,
//                   ),
//                   onPressed: () {
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 30),
//           DelayedAnimation(
//             delay: 0,
//             child: TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: "Adresse @mail",
//                 labelStyle: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 30),
//           DelayedAnimation(
//             delay: 0,
//             child: TextField(
//               controller: ppController,
//               decoration: InputDecoration(
//                 labelText: "Photo de profil",
//                 labelStyle: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           DelayedAnimation(
//             delay: 0,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: StadiumBorder(),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 125,
//                   vertical: 13,
//                 ),
//               ),
//               child: Text(
//                 'CONFIRM',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               onPressed: () {
//                 _insertData(nameController.text, mdpController.text,
//                     emailController.text, ppController.text);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MongoDbDisplay(),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




class SignForm extends StatefulWidget {
  get db => MongoDatabase();

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  checkData(String name, String mdp, String email){
    widget.db.GetCollection().find({
      "nom" : name,
      "mdp" : mdp
    }).toList().then((value){
        if(value.length == 1){
          setState((){
            print(value[1]);
            var nom = value[1];
            return nom;
          });
        }
        else{
          _insertData(name, mdp, email);
        }
      }
    );
  }

  var nameController = new TextEditingController();
  var mdpController = new TextEditingController();
  var mailController = new TextEditingController();
  var ppController = new TextEditingController();
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            DelayedAnimation(
              delay: 0,
              child: TextField(
                controller: nameController,

                decoration: InputDecoration(
                  labelText: 'nom',
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
                controller: mailController,

                decoration: InputDecoration(
                  labelText: 'email',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 0,
              child: TextField(
              controller: mdpController,

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
            SizedBox(height: 30),
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
                    _insertData(nameController.text, mdpController.text, mailController.text);//checkData(nameController.text,mdpController.text,mailController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Equitation(),
                      ),
                    );
                  },
              ),
            ),
            
          ],
        ),
      )
    );
  }
}

Future<void> _insertData(
    String name, String mdp, String email) async {
  var _id = M.ObjectId();
  final data = MongoDbModel(id: _id, name: name, mdp: mdp, mail: email);
  var result = await MongoDatabase.insereData(data);

  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("insert"+_id.$oid)));
}





// // ignore_for_file: prefer_const_constructors

// import 'package:app_flutter_coding/animation/delayed_animation.dart';
// import 'package:app_flutter_coding/bdd/insert.dart';

// import 'package:app_flutter_coding/bdd/update.dart';
// import 'package:flutter/material.dart';


// class InscriptionPage extends StatelessWidget {

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 33, 48, 50),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color.fromARGB(255, 33, 48, 50),
//         leading: IconButton(
//           icon: Icon(
//             Icons.close,
//             color: Color.fromARGB(232, 212, 161, 21),
//             size: 40,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(
//                 vertical: 40,
//                 horizontal: 30,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   DelayedAnimation(
//                     delay: 0,
//                     child: Text(
//                       "Créer un compte",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 22),
//                   DelayedAnimation(
//                     delay: 0,
//                     child: Text(
//                       "Créer un compte pour te connecter",
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 5),
//             MongoDbInsert(),            
//             SizedBox(height: 90),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding: EdgeInsets.only(right: 35),
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MongoDbUpdate(),
//                     ),
//                   );
//                   },
//                   child: DelayedAnimation(
//                     delay: 0,
//                     child: Text(
//                       "SKIP",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

