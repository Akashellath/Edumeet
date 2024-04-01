import 'package:edumeet_project_irohub/AdminChatPage.dart';
import 'package:edumeet_project_irohub/TeacherChatPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Chat",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: Color.fromARGB(255, 255, 17, 0),
          bottom: TabBar(
              indicatorWeight: 05,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Admin Chat",
                      style: GoogleFonts.barlowSemiCondensed(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400)
                      //  TextStyle(color: Colors.white, fontSize: 20),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Teacher Chat ",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold),
                      style: GoogleFonts.barlowSemiCondensed(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),
                )
              ]),
        ),
        body: TabBarView(children: [AdminChat(), teachersChatPage()]),
      ),
    );
  }
}
