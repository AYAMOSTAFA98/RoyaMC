// To parse this JSON data, do
//
//     final bestSellersModel = bestSellersModelFromJson(jsonString);

import 'dart:convert';

BestSellersModel bestSellersModelFromJson(String str) => BestSellersModel.fromJson(json.decode(str));

String bestSellersModelToJson(BestSellersModel data) => json.encode(data.toJson());

class BestSellersModel {
    bool value;
    List<Datum> data;

    BestSellersModel({
        required this.value,
        required this.data,
    });

    factory BestSellersModel.fromJson(Map<String, dynamic> json) => BestSellersModel(
        value: json["value"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String title;
    String photoFile;

    Datum({
        required this.id,
        required this.title,
        required this.photoFile,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        photoFile: json["photo_file"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "photo_file": photoFile,
    };
}
