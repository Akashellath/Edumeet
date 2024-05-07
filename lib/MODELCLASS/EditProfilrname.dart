// To parse this JSON data, do
//
//     final editProfileName = editProfileNameFromJson(jsonString);

import 'dart:convert';

EditProfileName editProfileNameFromJson(String str) => EditProfileName.fromJson(json.decode(str));

String editProfileNameToJson(EditProfileName data) => json.encode(data.toJson());

class EditProfileName {
    int status;
    Data data;

    EditProfileName({
        required this.status,
        required this.data,
    });

    factory EditProfileName.fromJson(Map<String, dynamic> json) => EditProfileName(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String firstName;
    String middleName;
    String lastName;

    Data({
        required this.firstName,
        required this.middleName,
        required this.lastName,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
    };
}
