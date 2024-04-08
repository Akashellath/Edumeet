import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:edumeet_project_irohub/LoginResponse.dart';
import 'package:edumeet_project_irohub/URL.dart';

class Apiclass {
  static Apiclass instance = Apiclass();
  factory() {
    return instance;
  }

  final dio = Dio();
  final url = URL();

  Apiclass() {
    dio.options =
        BaseOptions(baseUrl: url.BaseUrl, responseType: ResponseType.json);
  }

  Future<LoginResponse?> loginApi(FormData formData) async {
    try {
      final result = await dio.post(url.loginpageUrl, data: formData);
      return LoginResponse.fromJson(jsonDecode(result.data));
    } on DioException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
