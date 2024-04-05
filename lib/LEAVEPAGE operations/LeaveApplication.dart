import 'package:edumeet_project_irohub/LEAVEPAGE%20operations/AssingnedLeave.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LeaveApplly.dart';

class LeaveApplication extends StatefulWidget {
  int SelectPage;
  LeaveApplication({super.key, required this.SelectPage});

  @override
  State<LeaveApplication> createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<String> titleLists = [" Assinged Leave ", "Leave Aplly"];
  late String currentTitle;

  @override
  void  initState() {
    // TODO: implement initState
    currentTitle = titleLists[0];
    tabController =
        TabController(initialIndex: widget.SelectPage, length: 2, vsync: this);

    tabController.addListener(changeTitle);
  }

  void changeTitle() {
    setState(() {
      currentTitle = titleLists[tabController.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assigned Leave",
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              )),
        ],
        backgroundColor: Color.fromARGB(255, 255, 17, 0),
        bottom: TabBar(
            controller: tabController,
            indicatorWeight: 05,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Assigned Leave",
                    style: GoogleFonts.barlowSemiCondensed(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)
                    //  TextStyle(color: Colors.white, fontSize: 20),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Leave Apply ",
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
      body: TabBarView(
          controller: tabController, children: [Asssingdleave(), leaveApply()]),
    );
  }
}
