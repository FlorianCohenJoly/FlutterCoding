import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModelSoiree mongoDbModelFromJson(String str) => MongoDbModelSoiree.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModelSoiree data) => json.encode(data.toJson());
class MongoDbModelSoiree{
  MongoDbModelSoiree({
    required  this.id,
    required  this.theme,
    required  this.name,
    required this.date,
    required this.heure,
    required this.addresse,
  });

  ObjectId id;
  String theme;
  String name;
  String date;
  String heure;
  String addresse;

  factory MongoDbModelSoiree.fromJson(Map<String, dynamic> json) => MongoDbModelSoiree(
    id: json["_id"],
    theme: json["theme"],
    name: json["name"],
    date: json["date"],
    heure: json["heure"],
    addresse: json["addresse"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "theme": theme,
    "name": name,
    "date": date,
    "heure": heure,
    "addresse": addresse,
  };


}