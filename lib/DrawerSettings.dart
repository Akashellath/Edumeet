import 'package:edumeet_project_irohub/ACADEMIC/Event.dart';
import 'package:edumeet_project_irohub/APIs&URLs/ApiClass.dart';
import 'package:edumeet_project_irohub/LEAVEPAGE%20operations/LeaveApplication.dart';

import 'package:edumeet_project_irohub/PERSONAL/MyDiary.dart';
import 'package:edumeet_project_irohub/PERSONAL/MyProfile.dart';

import 'package:edumeet_project_irohub/PERSONAL/StaffDirectory.dart';
import 'package:edumeet_project_irohub/ACADEMIC/SubjectPage.dart';
import 'package:edumeet_project_irohub/ACADEMIC/TimetablePage.dart';
import 'package:edumeet_project_irohub/Dashboard.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';

//  All drawer control and settings are in this page

class drawerwidget extends StatefulWidget {
  const drawerwidget({
    super.key,
  });

  @override
  State<drawerwidget> createState() => _drawerwidgetState();
}

class _drawerwidgetState extends State<drawerwidget> {
  var logoutData = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetLogoutData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.2,
      child: ListView(
        children: [
          Container(
              height: 150,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 17, 0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("Asset/FB_IMG_1659716185316.jpg"),
                        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
                        radius: 42,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "HELLO",
                              style: GoogleFonts.jockeyOne(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Akash",
                                style: GoogleFonts.barlowSemiCondensed(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profilePaeg(),
                  ));
            },
            child: ListTile(
              leading: Icon(Icons.dashboard_outlined),
              title: Text("Dashbord",
                  style: GoogleFonts.rajdhani(
                      fontSize: 22, fontWeight: FontWeight.w500)),
            ),
          ),
          ExpansionTile(
            expansionAnimationStyle:
                AnimationStyle(reverseCurve: Curves.easeInOutCirc),
            childrenPadding: EdgeInsets.fromLTRB(50, 5, 0, 0),
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            leading: Icon(Icons.how_to_reg_outlined),
            title: Text("Personal",
                style: GoogleFonts.rajdhani(
                    fontSize: 22, fontWeight: FontWeight.w500)),
            trailing: Icon(Icons.keyboard_arrow_down_outlined),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Myprofile(),
                      ));
                },
                child: textwidget(
                  title: "My Profile",
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiaryPage(),
                        ));
                  },
                  child: textwidget(title: "My Diaries")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaffDirectory(),
                        ));
                  },
                  child: textwidget(title: "Staff Directory")),
              // GestureDetector(
              //     onTap: () {}, child: textwidget(title: "Calender"))  padikk padikk :)),
              ExpansionTile(
                title: Text("Leave Application",
                    style: GoogleFonts.rajdhani(
                        fontSize: 22, fontWeight: FontWeight.w500)),
                expansionAnimationStyle:
                    AnimationStyle(reverseCurve: Curves.easeInOutCirc),
                childrenPadding: EdgeInsets.fromLTRB(50, 5, 0, 0),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                trailing: Icon(Icons.keyboard_arrow_down_outlined),
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LeaveApplication(SelectPage: 0),
                            ));
                      },
                      child: textwidget(title: "Assigned Leave")),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LeaveApplication(SelectPage: 1)));
                      },
                      child: textwidget(title: "Leave Apply"))
                ],
              )
            ],
          ),
          ExpansionTile(
            expansionAnimationStyle:
                AnimationStyle(reverseCurve: Curves.easeInOutCirc),
            childrenPadding: EdgeInsets.fromLTRB(50, 5, 0, 0),
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            leading: Icon(Icons.school_outlined),
            title: Text("Academic",
                style: GoogleFonts.rajdhani(
                    fontSize: 22, fontWeight: FontWeight.w500)),
            trailing: Icon(Icons.keyboard_arrow_down_outlined),
            children: [
              // GestureDetector(
              //   onTap: () {
              //     // Navigator.push(
              //     //     context,
              //     //     MaterialPageRoute(
              //     //       builder: (context) => Myprofile(),
              //     //     ));
              //   },
              //   child: textwidget(
              //     title: "Assingment",
              //   ),
              // ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectPage(),
                        ));
                  },
                  child: textwidget(title: "Subject")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Timetable(),
                        ));
                  },
                  child: textwidget(title: "TimeTable")),
              // GestureDetector(
              //     onTap: () {}, child: textwidget(title: "Attendance")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(),
                        ));
                  },
                  child: textwidget(title: "Events")),
            ],
          ),
          GestureDetector(
            onTap: () {
              logoutAlertBox(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => Myprofile(),
              //     ));
            },
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout",
                  style: GoogleFonts.rajdhani(
                      fontSize: 22, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }

//Alert Box
  Future<dynamic> logoutAlertBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (alert) => AlertDialog(
        title: Text("Are you sure...?",
            style: GoogleFonts.rajdhani(
                fontSize: 22, fontWeight: FontWeight.w500)),
        content: Row(
          children: [
            (GestureDetector(
              onTap: () {
                GetLogoutData();
                print("ssssssssssssssssssssssssssssssssssssssss");
//
              },
              child: Container(
                child: Center(
                  child: Text("Yes",
                      style: GoogleFonts.rajdhani(
                          fontSize: 22, fontWeight: FontWeight.w500)),
                ),
                height: 40,
                width: 75,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 164, 142),
                    borderRadius: BorderRadius.circular(20)),
              ),
            )),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text("No",
                      style: GoogleFonts.rajdhani(
                          fontSize: 22, fontWeight: FontWeight.w500)),
                ),
                height: 40,
                width: 75,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 160, 231, 147),
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Api
  void GetLogoutData() async {
    final result = await Apiclass().logoutuserapi();
    setState(() {
      logoutData = result!.message!;
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$result");
      showSuccessMessage(result.message!);
    });
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

class textwidget extends StatelessWidget {
  var title;
  textwidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text("$title",
          style: GoogleFonts.rajdhani(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
