import 'package:dio/dio.dart';
import 'package:edumeet_project_irohub/MODELCLASS/LoginModel.dart';
import 'package:edumeet_project_irohub/APIs&URLs/URL.dart';
import 'package:edumeet_project_irohub/MODELCLASS/MyProfilePageModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/profilepagemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      return LoginResponse.fromJson((result.data));
    } on DioException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<ProfilePageModel?> profielpageApi() async {
    SharedPreferences sharedPreferences1 =
        await SharedPreferences.getInstance();
    var tok = sharedPreferences1.getString("Token");
    print("aaaaaaeeeeeeeeeeeeeeeeeeeeeee");
    print("token${tok}");
    final result = await dio.get(url.BaseUrl + url.DashbordpageUrl,
        options: Options(headers: {
          "content": "application/json",
          "Accepts": "application/json",
          "Authorization": "Bearer $tok"
        }));
    print("ppppppppppppppppppAAAPPPIII testingggggggggg${result}");
    return ProfilePageModel.fromJson(result.data);
  }

  Future<MyProfileDetails?> MyProfilepageApi() async {
    SharedPreferences sharedPreferences2 =
        await SharedPreferences.getInstance();
    var tok2 = sharedPreferences2.getString("Token");
    print("token2${tok2}");
    final result = await dio.get(url.BaseUrl + url.myprofilePageUrl,
        options: Options(headers: {
          "content": "application/json",
          "Accepts": "application/json",
          "Authorization": "Bearer $tok2"
        }));
  }
}