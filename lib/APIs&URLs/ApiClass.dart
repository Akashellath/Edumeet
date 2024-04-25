import 'package:dio/dio.dart';
import 'package:edumeet_project_irohub/MODELCLASS/DiariesModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/EventPageModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/LoginModel.dart';
import 'package:edumeet_project_irohub/APIs&URLs/URL.dart';
import 'package:edumeet_project_irohub/MODELCLASS/MyProfilePageModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/Staff-Directory.dart';
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
    final result = await dio.get(url.BaseUrl + url.DashbordPageUrl,
        options: Options(headers: {
          "content": "application/json",
          "Accepts": "application/json",
          "Authorization": "Bearer $tok"
        }));
    print("ppppppppppppppppppAAAPPPIII testingggggggggg${result}");
    return ProfilePageModel.fromJson(result.data);
  }

  Future<MyProfileDetails?> MyProfilepageApi() async {
    print("hellowwwwwww");
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
    print(" abababababababababababababababababbabababababab$result");
    return MyProfileDetails.fromJson(result.data);
  }

  Future<DiarypageModel?> myDiariyApi() async {
    try {
      SharedPreferences sharedPreferences3 =
          await SharedPreferences.getInstance();
      var tok3 = sharedPreferences3.getString("Token");

      final result = await dio.post(url.diariesUrl,
          options: Options(headers: {
            "content": "application/json",
            "Accepts": "application/json",
            "Authorization": "Bearer $tok3"
          }));
      print("0000000000000000000000yy${result.data!}");

      return DiarypageModel.fromJson((result.data));
    } on DioException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<StaffDirectoryModel?> staffDirectoryApi() async {
    SharedPreferences sharedPreferences4 =
        await SharedPreferences.getInstance();
    var tok4 = sharedPreferences4.getString("Token");
    final result = await dio.get(url.BaseUrl + url.staffdirectoryUrl,
        options: Options(headers: {
          "content": "application/json",
          "Accepts": "application/json",
          "Authorization": "Bearer $tok4"
        }));
    return StaffDirectoryModel.fromJson(result.data);
  }

  Future<EventPageModel?> EventPageApi() async {
    SharedPreferences sharedPreferences5 =
        await SharedPreferences.getInstance();
    var token5 = sharedPreferences5.getString("Token");
    final result = await dio.post(url.EventPageUrl,
        options: Options(headers: {
          "content": "application/json",
          "Accepts": "application/json",
          "Authorization": "Bearer $token5"
        }));
    print("pppppppppppppppppppppppppppppppppppppppppppp${result.data}");
    return eventPageModelFromJson(result.data);
  }
}
