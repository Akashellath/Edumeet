class Logoutmodel {
  int? status;
  String? message;

  Logoutmodel({this.status, this.message});

  Logoutmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
