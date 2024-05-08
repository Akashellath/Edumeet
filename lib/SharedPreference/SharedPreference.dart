import 'package:shared_preferences/shared_preferences.dart';

void saveLoginData(token) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("Token", token);
}


Future<void>saveNameData(firstnam)async{"jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj";
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("name1", firstnam);
   var profilename =sharedPreferences.getString("name1")??""; 
   print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkshareed$firstnam");
 }



Future<void>saveProfileImage(var profileimaageUrl)async{
  print("cccccccccccccccccccccccccccccccccccccccccccccccc$profileimaageUrl");

  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("profileimg",  profileimaageUrl);
   var profilename =sharedPreferences.getString("profileimg")??""; 
   print("pppppppppppppppppppppppppppppppppppppppppppppppppppppppshareed$profileimaageUrl");
     
 }

 
