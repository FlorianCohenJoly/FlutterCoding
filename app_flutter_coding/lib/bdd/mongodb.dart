import 'dart:developer';

import 'package:app_flutter_coding/bdd/constant.dart';
import 'package:app_flutter_coding/bdd/mongoDBModelStable.dart';
import 'package:app_flutter_coding/bdd/mongoDBModelSoiree.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:app_flutter_coding/bdd/mongoDBModel.dart';

class MongoDatabase {
  static var stable;
  static var soiree;
  static var collection;
  static var collectionCours;
  static var collectionConcours;
  static connect() async {
    var db = await Db.create(MONGO_url);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    soiree = db.collection(COLLECTION_NAME_SOIREE);
    stable = db.collection(COLLECTION_NAME_STABLE);
    collection = db.collection(COLLECTION_NAME);
    collectionCours = db.collection("cours");
    collectionConcours = db.collection("concours");
    print(await collection.find().toList());
  }


  static Future<List<Map<String, dynamic >>> getData() async {
    final arrData = await stable.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getDataConcours() async {
    final arrData = await collectionConcours.find().toList();
  return arrData;
  }



  static Future<void> update (MongoDbModelStable data) async{
    var result = await stable.findOne({"_id": data.id});
    result['name'] = data.name;
    result['cavalier'] = data.cavalier;
    result['horse'] = data.horse;

    var response = await stable.save(result);
    inspect(response);
  }

  static Future<void> updateData (MongoDbModel data) async{
    var result = await collection.findOne({"_id": data.id});
    result['name'] = data.name;
    result['mdp'] = data.mdp;
    result['mail'] = data.mail;
    result['pp'] = data.pp;

   var response = await collection.save(result);
   inspect(response);
  }



  static Future<String> insert(MongoDbModelStable data) async {
    try {
      var result = await stable.insertOne(data.toJson());
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

  static Future<String> insereData(MongoDbModel data) async {
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

  static Future<String> insertData(MongoDbModel data) async {
    try {
      var result = await stable.insertOne(data.toJson());
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

  static Future<String> insertConcours(MongoDbModelConcours data) async {
    try {
      var result = await collectionConcours.insertOne(data.toJson());
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


  static Future<String> insertCours(MongoDbModelCours data) async {
    try {
      var result = await collectionCours.insertOne(data.toJson());
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

  static Future<String> insere(MongoDbModel data) async {
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

  static Future<List<Map<String, dynamic >>> getDataStable() async {
    final arrData = await stable.find().toList();
    return arrData;

  }



  static Future<void> updateStable (MongoDbModelStable data) async{
    var result = await stable.findOne({"_id": data.id});
    result['name'] = data.name;
    result['cavalier'] = data.cavalier;
    result['horse'] = data.horse;

    var response = await stable.save(result);
    inspect(response);
  }



  static Future<String> insertStable(MongoDbModelStable data) async {
    try {
      var result = await stable.insertOne(data.toJson());
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

  static Future<String> delete(MongoDbModelStable data) async {
    try {
      var result = await stable.remove({"_id": data.id});
      if (result.isSucces) {
        return "data deleted";
      } else {
        return "erreur";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  ////////// SOIREE //////////

  static Future<List<Map<String, dynamic >>> getDataSoiree() async {
    final arrData = await soiree.find().toList();
    return arrData;

  }

  static Future<String> insertSoiree(MongoDbModelSoiree data) async {
    try {
      var result = await soiree.insertOne(data.toJson());
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

  static Future<void> updateSoiree (MongoDbModelSoiree data) async{
    var result = await soiree.findOne({"_id": data.id});
    result['theme'] = data.theme;
    result['name'] = data.name;
    result['date'] = data.date;
    result['heure'] = data.heure;
    result['adresse'] = data.adresse;

    var response = await soiree.save(result);
    inspect(response);
  }

  static Future<void> deleteSoiree (MongoDbModelSoiree data) async{
    var result = await soiree.findOne({"_id": data.id});
    var response = await soiree.remove(result);
    inspect(response);
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
