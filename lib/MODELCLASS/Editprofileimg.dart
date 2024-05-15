// To parse this JSON data, do
//
//     final editprofileimg = editprofileimgFromJson(jsonString);

import 'dart:convert';

Editprofileimg editprofileimgFromJson(String str) => Editprofileimg.fromJson(json.decode(str));

String editprofileimgToJson(Editprofileimg data) => json.encode(data.toJson());

class Editprofileimg {
    int status;
    Data data;

    Editprofileimg({
        required this.status,
        required this.data,
    });

    factory Editprofileimg.fromJson(Map<String, dynamic> json) => Editprofileimg(
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
    String profileImage;

    Data({
        required this.id,
        required this.profileImage,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profile_image": profileImage,
    };
}
