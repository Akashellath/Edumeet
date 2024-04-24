class StaffDirectoryModel {
  int? status;
  List<Data>? data;

  StaffDirectoryModel({this.status, this.data});

  StaffDirectoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? subject;
  String? teachers;

  Data({this.subject, this.teachers});

  Data.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    teachers = json['teachers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['teachers'] = this.teachers;
    return data;
  }
}
