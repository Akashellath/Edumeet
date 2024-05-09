// import 'package:edumeet_project_irohub/AlertboxLeavePage.dart';
import 'package:dio/dio.dart';
import 'package:edumeet_project_irohub/APIs&URLs/ApiClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';

import 'AlertboxLeavePage.dart';

class leaveApply extends StatefulWidget {
  const leaveApply({super.key});

  @override
  State<leaveApply> createState() => _leaveApplyState();
}

class _leaveApplyState extends State<leaveApply> {
  var names = [];
  var dataa = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LeaveapplyGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 223, 223),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.32,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: dataa.length,
                  itemBuilder: (context, index) {
                    print(
                        "gjhhjggjlmllmmlmlmllmllmllmlmmlmlmlmllmlmlmlmlmllmlm$dataa");
                    return Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10, right: 8, left: 8),
                          child: Row(
                            children: [
                              Text(
                                "Date:",
                                style: GoogleFonts.rajdhani(
                                  color: Color.fromARGB(255, 88, 87, 87),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                dataa[index].applyDate.toString(),
                                style: GoogleFonts.rajdhani(
                                  color: Color.fromARGB(255, 88, 87, 87),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Status :",
                                style: GoogleFonts.rajdhani(
                                  color: Color.fromARGB(255, 88, 87, 87),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 26,
                                width: 85,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 95, 2),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: Text(
                                  "Pending",
                                  style: GoogleFonts.rajdhani(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 10, left: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.2,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0, 2.0))
                                ],
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 8, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Applicant's Name",
                                            style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 88, 87, 87),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            //""
                                            //
                                            //
                                            //
                                            //
                                            //
                                            //
                                            dataa[index]
                                                .studentname
                                                .firstName
                                                .toString()
                                            // "Akash"
                                            ,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Schedule",
                                            style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 88, 87, 87),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                dataa[index]
                                                    .fromDate.year
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // Text(
                                              //   "-",
                                              //   style: TextStyle(
                                              //       fontSize: 18,
                                              //       fontWeight: FontWeight.bold),
                                              // ),
                                              // Text(
                                              //   "datessss",
                                              //   style: TextStyle(
                                              //       fontSize: 15,
                                              //       fontWeight: FontWeight.bold),
                                              // )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Reason",
                                            style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 88, 87, 87),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            dataa[index].reason.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 100,
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Category",
                                            style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 88, 87, 87),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            dataa[index]
                                                .leaveCategoryname
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Days",
                                            style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 88, 87, 87),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                dataa[index]
                                                    .leaveDays
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Attachment",
                                    style: GoogleFonts.rajdhani(
                                      color: Color.fromARGB(255, 88, 87, 87),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    height: 26,
                                    width: 85,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 120, 119, 119),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 26,
                                        width: 85,
                                        child: Center(
                                            child: Text(
                                          "Edit",
                                          style: GoogleFonts.rajdhani(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 255, 95, 2),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Container(
                                        height: 26,
                                        width: 90,
                                        child: Center(
                                            child: Text(
                                          "Delet",
                                          style: GoogleFonts.rajdhani(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 255, 17, 0),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(
                height: 70,
                width: double.infinity,
                //   color: Color.fromARGB(255, 226, 223, 223),
                // child: Container(
                //   width: 60,
                //   height: 20,
                //   color: Colors.red,
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 17, 0),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        "Add a Leave Application",
                        style: GoogleFonts.rajdhani(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                    onTap: () {
                      LeaveApplicationAlertbox(context);
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void LeaveapplyGetData() async {
    final result = await Apiclass().leaveapplydataUrl();
    setState(() {
      dataa.addAll(result!.data);
      print("plplplplplpplpllplplplplplplplplplplplplplplplpl$result");
    });
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
