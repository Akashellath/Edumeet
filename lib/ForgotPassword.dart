import 'package:flutter/material.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 17, 0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter  email", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 30, left: 30),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
