import 'package:edumeet_project_irohub/leave/AssingnedLeave.dart';
import 'package:edumeet_project_irohub/Event.dart';
import 'package:edumeet_project_irohub/leave/LeaveApplication.dart';
import 'package:edumeet_project_irohub/leave/LeaveApplly.dart';
import 'package:edumeet_project_irohub/MyDiary.dart';
import 'package:edumeet_project_irohub/MyProfile.dart';
import 'package:edumeet_project_irohub/StaffDirectory.dart';
import 'package:edumeet_project_irohub/SubjectPage.dart';
import 'package:edumeet_project_irohub/TimetablePage.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

//  All drawer control and settings are in this page

class drawerwidget extends StatelessWidget {
  const drawerwidget({
    super.key,
  });

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
                    builder: (context) => Myprofile(),
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
                                builder: (context) => leaveApply()
                                //  LeaveApplication(
                                //   Selectpage: 0,
                                // ),
                                ));
                      },
                      child: textwidget(title: "Assigned Leave")),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => leaveApply()
                                // LeaveApplication(
                                //   Selectpage: ,
                                // ),
                                ));
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
