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
    required this.adresse,
  });

  ObjectId id;
  String theme;
  String name;
  String date;
  String heure;
  String adresse;

  factory MongoDbModelSoiree.fromJson(Map<String, dynamic> json) => MongoDbModelSoiree(
    id: json["_id"],
    theme: json["theme"],
    name: json["name"],
    date: json["date"],
    heure: json["heure"],
    adresse: json["adresse"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "theme": theme,
    "name": name,
    "date": date,
    "heure": heure,
    "adresse": adresse,
  };


}