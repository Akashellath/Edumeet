import 'package:dio/dio.dart';
import 'package:edumeet_project_irohub/MODELCLASS/AssignedLeaveModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/DashboardModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/DiariesModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/EditProfilrname.dart';
import 'package:edumeet_project_irohub/MODELCLASS/Editprofileimg.dart';
import 'package:edumeet_project_irohub/MODELCLASS/EventPageModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/LeaveApplySavepost.dart';

import 'package:edumeet_project_irohub/MODELCLASS/LoginModel.dart';

import 'package:edumeet_project_irohub/APIs&URLs/URL.dart';
import 'package:edumeet_project_irohub/MODELCLASS/LogoutModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/MyProfilePageModel.dart';
import 'package:edumeet_project_irohub/MODELCLASS/Staff-Directory.dart';
import 'package:edumeet_project_irohub/MODELCLASS/leaveapplydata.dart';

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
      return LoginResponse.fromJson(result.data);
    } on DioException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  // Future<ProfilePageModel?> profielpageApi() async {
  //   SharedPreferences sharedPreferences1 =
  //       await SharedPreferences.getInstance();
  //   var tok = sharedPreferences1.getString("Token");
  //   print("aaaaaaeeeeeeeeeeeeeeeeeeeeeee");
  //   print("token${tok}");
  //   final result = await dio.get(url.BaseUrl + url.DashbordPageUrl,
  //       options: Options(headers: {
  //         "content": "application/json",
  //         "Accepts": "application/json",
  //         "Authorization": "Bearer $tok"
  //       }));
  //   print("ppppppppppppppppppAAAPPPIII testingggggggggg${result}");
  //   return ProfilePageModel.fromJson(result.data);
  // }

  Future<Dashboard?>DashBoardApi()async{
    print("hello");
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var ttok=sharedPreferences.getString("Token");
    final result=await  dio.get(url.BaseUrl+url.DashbordPageUrl,options: Options(headers: {  "content": "application/json",
          "Accepts": "application/json",
          "Authorization": "Bearer $ttok"}));
          return Dashboard.fromJson(result.data);
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

  Future<AssignedLeaveModel?> AssignedPageApi() async {
    SharedPreferences sharedPreferences6 =
        await SharedPreferences.getInstance();

    var token6 = sharedPreferences6.getString("Token");
    final result = await dio.get(url.BaseUrl + url.AssignedLeaveUrl,
        options: Options(headers: {
          "content": "application/json",
          "Accepts": "application/json",
          "Authorization": "Bearer $token6"
        }));
    return assignedLeaveModelFromJson(result.data);
  }

  /*Future<Logoutmodel?> LougoutApi() async {
    SharedPreferences sharedPreferences7 =
        await SharedPreferences.getInstance();
    var token7 = sharedPreferences7.getString("Token");
    final result = dio.get(url.BaseUrl + url.LogoutUrl,
        options: Options(headers: {
          "content": "application/json",
          "Accepts": "application/json",
          "Authorization": "Bearer $token7"
        }));
    return Logoutmodel.fromJson(result);
  }*/
  
  
  Future< Logoutmodel?>logoutuserapi()async{
  SharedPreferences share = await SharedPreferences.getInstance();
  var tok = share.getString("Token");
  final result = await dio.get(url.LogoutUrl,
  options: Options(headers: {
    "Content": "application/json",
      "Accepts" : "application/json",
      "Authorization": "Bearer $tok"
  }));
  print("logggggggg${result}");
  return Logoutmodel.fromJson((result.data));
}

  
Future<LeaveApplyData?>leaveapplydataUrl()async{
  SharedPreferences sharedPreferences88 =await SharedPreferences.getInstance();
  var tok9=sharedPreferences88.getString("Token");
  final result =await dio.post(url.LeaveApplyUrl,options: Options(headers: { 
    "Content": "application/json",
      "Accepts" : "application/json",
      "Authorization": "Bearer $tok9"}));
      print("klklklklklklklklklkklklkklklklklklklkllkllklkkl$result");
      return LeaveApplyData.fromJson(result.data);
}





Future<LeaveApplySave?>LeaveApplySaveApi(FormData formData)async{print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyy$formData");
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  var tokk=sharedPreferences.getString("Token");
  final result=await dio.post(url.LeaveApplySaveUrl,data: formData,options: Options(headers: { 
     "Content": "application/json",
      "Accepts" : "application/json",
      "Authorization": "Bearer $tokk"})
      );print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr$result");
      return LeaveApplySave.fromJson(result.data);
      
}

Future<EditProfileName?>EditProfileNameApi(FormData formData)async{
SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
var tokken=sharedPreferences.getString("Token");
final result=await dio.post(url.EditProfileNAmeUrl,data: formData,options: Options(headers:{
    "Content": "application/json",
      "Accepts" : "application/json",
      "Authorization": "Bearer $tokken"
} ));
return EditProfileName.fromJson(result.data);
}

Future<Editprofileimg?>EditProfileimgApi(FormData formData)async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  var tokkeen=preferences.getString("Token");
  final result=await dio.post(url.EditProfileimgUrl,data: formData,options: Options(headers: {
"Content": "application/json",
      "Accepts" : "application/json",
      "Authorization": "Bearer $tokkeen"
  }));
}



 
}
