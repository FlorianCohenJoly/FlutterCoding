// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
    MongoDbModel({
      required  this.id,
      required  this.name,
      required this.mdp,
      required  this.mail
    });

    ObjectId id;
    String name;
    String mdp;
    String mail;

    factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        name: json["name"],
        mdp: json["mdp"],
        mail: json["mail"]
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "mdp": mdp,
        "mail": mail
    };
}

class MongoDbModelCours {
    MongoDbModelCours({
      required  this.id,
      required  this.terrain,
      required this.date,
      required  this.heure,
      required this.duree,
      required this.discipline,
    });

    ObjectId id;
    String terrain;
    String date;
    String heure;
    String duree;
    String discipline;

    factory MongoDbModelCours.fromJson(Map<String, dynamic> json) => MongoDbModelCours(
        id: json["_id"],
        terrain: json["terrain"],
        date: json["date"],
        heure: json["heure"],
        duree: json["duree"],
        discipline: json["discipline"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "terrain": terrain,
        "date": date,
        "heure": heure,
        "duree": duree,
        "discipline": discipline,
    };
}
class MongoDbModelConcours {
    MongoDbModelConcours({
      required  this.id,
      required  this.nom,
      required this.adresse,
      required this.date
    });

    ObjectId id;
    String nom;
    String adresse;
    String date;

    factory MongoDbModelConcours.fromJson(Map<String, dynamic> json) => MongoDbModelConcours(
        id: json["_id"],
        nom: json["nom"],
        adresse: json["adresse"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nom": nom,
        "adresse": adresse,
        "date": date,
    };
}
