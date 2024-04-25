// To parse this JSON data, do
//
//     final eventPageModel = eventPageModelFromJson(jsonString);

import 'dart:convert';

EventPageModel eventPageModelFromJson(String str) => EventPageModel.fromJson(json.decode(str));

String eventPageModelToJson(EventPageModel data) => json.encode(data.toJson());

class EventPageModel {
    int status;
    List<Datum> data;

    EventPageModel({
        required this.status,
        required this.data,
    });

    factory EventPageModel.fromJson(Map<String, dynamic> json) => EventPageModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String note;
    DateTime date;

    Datum({
        required this.id,
        required this.note,
        required this.date,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
