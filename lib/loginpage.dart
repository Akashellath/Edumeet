import 'package:dio/dio.dart';
import 'package:edumeet_project_irohub/SharedPreference.dart';
import '../Api&URLs/ApiClass.dart';
import 'package:edumeet_project_irohub/ForgotPassword.dart';
import 'package:edumeet_project_irohub/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

var Usernamecontroller = TextEditingController();
var Passwordcontroller = TextEditingController();

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  "Asset/loginPageLogo.jpg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 17, 0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: Usernamecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "User Name")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: Passwordcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => forgotpassword(),
                        ));
                  },
                  child: Text(
                    "Forgot your Password?",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    loginPost();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loginPost() async {
    final username = Usernamecontroller.text;
    final password = Passwordcontroller.text;
    if (username.isEmpty) {
      showErrorMessage("Please enter Username");
    } else if (password.isEmpty) {
      showErrorMessage("Please enter Password");
    } else {
      final formData1 =
          FormData.fromMap({"username": username, "password": password});
      final result = await Apiclass().loginApi(formData1);
      if (result != null) {
        if (result.status == 1) {
          showSuccessMessage("succsessfully Logged");
          saveLoginData(result.message);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => profilePaeg(),
              ));
        } else {
          showErrorMessage("unsuccsessfull :)");
        }
      }
    }
  }

  void showErrorMessage(String message) {
    MotionToast.error(
      title: Text("Error"),
      description: Text(message),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context);
  }

  void showSuccessMessage(String message) {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(message),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: false,
    ).show(context);
  }
}
