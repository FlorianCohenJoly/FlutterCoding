import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModelStable mongoDbModelFromJson(String str) => MongoDbModelStable.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModelStable data) => json.encode(data.toJson());

class MongoDbModelStable {
  MongoDbModelStable({
    required  this.id,
    required  this.name,
    required this.cavalier,
    required this.horse,
  });

  ObjectId id;
  String name;
  String cavalier;
  String horse;

  factory MongoDbModelStable.fromJson(Map<String, dynamic> json) => MongoDbModelStable(
    id: json["_id"],
    name: json["name"],
    cavalier: json["cavalier"],
    horse: json["horse"],

  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "cavalier": cavalier,
    "horse": horse,
  };
}