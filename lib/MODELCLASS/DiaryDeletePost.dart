// To parse this JSON data, do
//
//     final dairyPostModel = dairyPostModelFromJson(jsonString);

import 'dart:convert';

DairyPostModel dairyPostModelFromJson(String str) => DairyPostModel.fromJson(json.decode(str));

String dairyPostModelToJson(DairyPostModel data) => json.encode(data.toJson());

class DairyPostModel {
    int status;
    String message;

    DairyPostModel({
        required this.status,
        required this.message,
    });

    factory DairyPostModel.fromJson(Map<String, dynamic> json) => DairyPostModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
