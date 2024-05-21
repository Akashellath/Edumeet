// To parse this JSON data, do
//
//     final dairyDeletPost = dairyDeletPostFromJson(jsonString);

import 'dart:convert';

DairyDeletPost dairyDeletPostFromJson(String str) => DairyDeletPost.fromJson(json.decode(str));

String dairyDeletPostToJson(DairyDeletPost data) => json.encode(data.toJson());

class DairyDeletPost {
    int status;
    String message;

    DairyDeletPost({
        required this.status,
        required this.message,
    });

    factory DairyDeletPost.fromJson(Map<String, dynamic> json) => DairyDeletPost(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
