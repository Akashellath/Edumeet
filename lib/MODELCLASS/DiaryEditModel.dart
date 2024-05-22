// To parse this JSON data, do
//
//     final dairyEditPost = dairyEditPostFromJson(jsonString);

import 'dart:convert';

DairyEditPost dairyEditPostFromJson(String str) => DairyEditPost.fromJson(json.decode(str));

String dairyEditPostToJson(DairyEditPost data) => json.encode(data.toJson());

class DairyEditPost {
    int status;
    Data data;

    DairyEditPost({
        required this.status,
        required this.data,
    });

    factory DairyEditPost.fromJson(Map<String, dynamic> json) => DairyEditPost(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String note;
    DateTime date;

    Data({
        required this.id,
        required this.note,
        required this.date,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        note: json["note"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}
