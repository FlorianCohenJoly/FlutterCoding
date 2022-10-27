import 'dart:developer';

import 'package:app_flutter_coding/bdd/constant.dart';
import 'package:app_flutter_coding/bdd/mongoDbModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var collection;
  static connect() async {
    var db = await Db.create(MONGO_url);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    collection = db.collection(COLLECTION_NAME);
    print(await collection.find().toList());
  }


  static Future<List<Map<String, dynamic >>> getData() async {
    final arrData = await collection.find().toList();
    return arrData;
  }



  static Future<void> update (MongoDbModel data) async{
    var result = await collection.findOne({"_id": data.id});
    result['name'] = data.name;
    result['mdp'] = data.mdp;
    result['mail'] = data.mail;
    result['pp'] = data.pp;

   var response = await collection.save(result);
   inspect(response);
  }




  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await collection.insertOne(data.toJson());
      if (result.isSucces) {
        return "data inserted";
      } else {
        return "erreur";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}




// Ajouter un users
    // await collection.insertMany([{
    //   "username": "mp2",
    //   "name": "Max Payne2",
    //   "email": "mp2@gmail.com",
    // },
    // {
    //    "username": "mp3",
    //   "name": "Max Payne3",
    //   "email": "mp3@gmail.com",

    // },
    // ]);

    // Changer un user
    // await collection.update(where.eq('username', 'mp'), modify.set('name', 'Max P'));
    // //await collection.updateMany(where.eq('username', 'mp'), modify.set('name', 'Max P'));

    // Delete un user
    // await collection.deleteOne({"username": "mp",});
    // await collection.deleteMany({"username": "mp2",});