import 'package:edumeet_project_irohub/APIs&URLs/ApiClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffDirectory extends StatefulWidget {
  StaffDirectory({super.key});
  @override
  State<StaffDirectory> createState() => _StaffDirectoryState();
}

class _StaffDirectoryState extends State<StaffDirectory> {
  var StaffData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStaffDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 17, 0),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
                size: 30,
              )),
          title: Text("Staff Directory",
              style: GoogleFonts.rajdhani(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 234, 234, 234),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text("Subject Teacher ",
                          style: GoogleFonts.rajdhani(
                              color: Color.fromARGB(255, 69, 69, 69),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 234, 234, 234),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 90,
                        width: 60,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.2,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0, 2.0))
                            ],
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Subject  :",
                                          style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 58, 58, 58),
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold)),
                                      Text(StaffData[index].subject,
                                          style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 58, 58, 58),
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("Teacher  :",
                                          style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 58, 58, 58),
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold)),
                                      Text(StaffData[index].teachers,
                                          style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 58, 58, 58),
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: StaffData.length,
                  ))

              //
            ],
          ),
        ));
  }

  void getStaffDirectory() async {
    final result = await Apiclass().staffDirectoryApi();
    setState(() {
      StaffData.addAll(result!.data!);
    });
  }
}
