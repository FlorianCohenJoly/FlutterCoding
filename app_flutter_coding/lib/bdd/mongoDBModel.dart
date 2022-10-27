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
      required  this.mail,
      required this.pp,
    });

    ObjectId id;
    String name;
    String mdp;
    String mail;
    String pp;

    factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        name: json["name"],
        mdp: json["mdp"],
        mail: json["mail"],
        pp: json["pp"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "mdp": mdp,
        "mail": mail,
        "pp": pp,
    };
}

class MongoDbModelConcours {
    MongoDbModelConcours({
      required  this.id,
      required  this.nom,
      required this.adresse,
      required  this.photo,
      required this.date,
    });

    ObjectId id;
    String nom;
    String adresse;
    String photo;
    String date;

    factory MongoDbModelConcours.fromJson(Map<String, dynamic> json) => MongoDbModelConcours(
        id: json["_id"],
        nom: json["nom"],
        adresse: json["adresse"],
        photo: json["photo"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nom": nom,
        "adresse": adresse,
        "photo": photo,
        "date": date,
    };
}

