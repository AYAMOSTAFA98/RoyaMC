// To parse this JSON data, do
//
//     final departmentsModel = departmentsModelFromJson(jsonString);

import 'dart:convert';

DepartmentsModel departmentsModelFromJson(String str) => DepartmentsModel.fromJson(json.decode(str));

String departmentsModelToJson(DepartmentsModel data) => json.encode(data.toJson());

class DepartmentsModel {
    bool value;
    List<Department> data;

    DepartmentsModel({
        required this.value,
        required this.data,
    });

    factory DepartmentsModel.fromJson(Map<String, dynamic> json) => DepartmentsModel(
        value: json["value"],
        data: List<Department>.from(json["data"].map((x) => Department.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Department {
    int id;
    String photo;
    String title;
    String rightDetails;
    String fullUrl;

    Department({
        required this.id,
        required this.photo,
        required this.title,
        required this.rightDetails,
        required this.fullUrl,
    });

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        photo: json["photo"],
        title: json["title"],
        rightDetails: json["right_details"],
        fullUrl: json["full_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "title": title,
        "right_details": rightDetails,
        "full_url": fullUrl,
    };
}
