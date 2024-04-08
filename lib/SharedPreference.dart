import 'package:shared_preferences/shared_preferences.dart';

void saveLoginData(token) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("Token", token);
}
