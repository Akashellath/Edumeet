// To parse this JSON data, do
//
//     final assignedLeaveModel = assignedLeaveModelFromJson(jsonString);

import 'dart:convert';

AssignedLeaveModel assignedLeaveModelFromJson(String str) => AssignedLeaveModel.fromJson(json.decode(str));

String assignedLeaveModelToJson(AssignedLeaveModel data) => json.encode(data.toJson());

class AssignedLeaveModel {
    int status;
    List<Datum> data;

    AssignedLeaveModel({
        required this.status,
        required this.data,
    });

    factory AssignedLeaveModel.fromJson(Map<String, dynamic> json) => AssignedLeaveModel(
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
    String name;

    Datum({
        required this.id,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
