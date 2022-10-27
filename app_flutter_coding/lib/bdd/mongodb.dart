import 'dart:developer';

import 'package:app_flutter_coding/bdd/constant.dart';
import 'package:app_flutter_coding/bdd/mongoDBModelStable.dart';
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



  static Future<void> update (MongoDbModelStable data) async{
    var result = await collection.findOne({"_id": data.id});
    result['name'] = data.name;
    result['cavalier'] = data.cavalier;
    result['horse'] = data.horse;

    var response = await collection.save(result);
    inspect(response);
  }




  static Future<String> insert(MongoDbModelStable data) async {
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