// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
    int status;
    Student student;
    List<Notice> notice;

    Dashboard({
        required this.status,
        required this.student,
        required this.notice,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        status: json["status"],
        student: Student.fromJson(json["student"]),
        notice: List<Notice>.from(json["notice"].map((x) => Notice.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "student": student.toJson(),
        "notice": List<dynamic>.from(notice.map((x) => x.toJson())),
    };
}

class Notice {
    int id;
    String title;
    String description;

    Notice({
        required this.id,
        required this.title,
        required this.description,
    });

    factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        id: json["id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
    };
}

class Student {
    String firstName;
    String middleName;
    String lastName;
    String regNumber;
    String studentClass;
    int division;
    int rollNumber;
    String dob;
    String code;
    int parent;
    String profileImage;
    String profileImageUrl;
    Parents parents;
    Classname classname;
    Classname divisions;

    Student({
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.regNumber,
        required this.studentClass,
        required this.division,
        required this.rollNumber,
        required this.dob,
        required this.code,
        required this.parent,
        required this.profileImage,
        required this.profileImageUrl,
        required this.parents,
        required this.classname,
        required this.divisions,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        regNumber: json["reg_number"],
        studentClass: json["class"],
        division: json["division"],
        rollNumber: json["roll_number"],
        dob: json["dob"],
        code: json["code"],
        parent: json["parent"],
        profileImage: json["profile_image"],
        profileImageUrl: json["profile_image_url"],
        parents: Parents.fromJson(json["parents"]),
        classname: Classname.fromJson(json["classname"]),
        divisions: Classname.fromJson(json["divisions"]),
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "reg_number": regNumber,
        "class": studentClass,
        "division": division,
        "roll_number": rollNumber,
        "dob": dob,
        "code": code,
        "parent": parent,
        "profile_image": profileImage,
        "profile_image_url": profileImageUrl,
        "parents": parents.toJson(),
        "classname": classname.toJson(),
        "divisions": divisions.toJson(),
    };
}

class Classname {
    int id;
    String name;

    Classname({
        required this.id,
        required this.name,
    });

    factory Classname.fromJson(Map<String, dynamic> json) => Classname(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Parents {
    int id;
    String firstName;
    String lastName;
    String imageUrl;
    String photo;

    Parents({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.imageUrl,
        required this.photo,
    });

    factory Parents.fromJson(Map<String, dynamic> json) => Parents(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        imageUrl: json["image_url"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "image_url": imageUrl,
        "photo": photo,
    };
}
