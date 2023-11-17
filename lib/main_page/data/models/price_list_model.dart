// To parse this JSON data, do
//
//     final priceListModel = priceListModelFromJson(jsonString);
import 'dart:convert';

PriceListModel priceListModelFromJson(String str) => PriceListModel.fromJson(json.decode(str));

String priceListModelToJson(PriceListModel data) => json.encode(data.toJson());

class PriceListModel {
    bool value;
    List<Datum> data;

    PriceListModel({
        required this.value,
        required this.data,
    });

    factory PriceListModel.fromJson(Map<String, dynamic> json) => PriceListModel(
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
    List<PriceList> priceLists;

    Datum({
        required this.id,
        required this.title,
        required this.priceLists,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        priceLists: List<PriceList>.from(json["price_lists"].map((x) => PriceList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price_lists": List<dynamic>.from(priceLists.map((x) => x.toJson())),
    };
}

class PriceList {
    int id;
    String title;
    String price;
    String details;
    String photoFile;

    PriceList({
        required this.id,
        required this.title,
        required this.price,
        required this.details,
        required this.photoFile,
    });

    factory PriceList.fromJson(Map<String, dynamic> json) => PriceList(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        details: json["details"],
        photoFile: json["photo_file"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "details": details,
        "photo_file": photoFile,
    };
}
