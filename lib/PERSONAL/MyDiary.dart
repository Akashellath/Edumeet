import 'package:dio/dio.dart';
import 'package:edumeet_project_irohub/APIs&URLs/ApiClass.dart';
import 'package:edumeet_project_irohub/CHAT/chatPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';

class DiaryPage extends StatefulWidget {
  DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  var datas = [];
  var note = [];
  // var ID=  datas["id"].toString();
var idDIary="";
  var DairyDatecontroller = TextEditingController();
  var DairyNotecontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDiaryDetaills();
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
            title: Text("Diary",
                style: GoogleFonts.rajdhani(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  child: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => chatpage(),
                        ));
                  },
                ),
              )
            ]),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 234, 234, 234),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          DiaryPageAlertBox(context);
                        },
                        child: Text("Add Diaries +",
                            style: GoogleFonts.rajdhani(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 234, 234, 234),
                    child: ListView.builder(
                      
                      itemBuilder: (context, index) {
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 140,
                          width: 60,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2.2,
                                    spreadRadius: 0.0,
                                    offset: Offset(1.0, 1.0))
                              ],
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.2,
                                          spreadRadius: 0.0,
                                          offset: Offset(2.0, 2.0))
                                    ],
                                    color: Color.fromARGB(255, 202, 201, 201),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    datas[index].id.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 99, 98, 98),
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(datas[index].note,
                                        style: GoogleFonts.rajdhani(
                                            color:
                                                Color.fromARGB(255, 99, 98, 98),
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("Date:",
                                            style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 88, 87, 87),
                                              fontSize: 15,
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(datas[index].date,
                                            style: GoogleFonts.rajdhani(
                                              color: Color.fromARGB(
                                                  255, 88, 87, 87),
                                              fontSize: 15,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Container(
                                            height: 35,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 2.2,
                                                      spreadRadius: 0.0,
                                                      offset: Offset(1.0, 1.0))
                                                ],
                                                color: Color.fromARGB(
                                                    255, 255, 165, 0),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                                child: Text("Edit",
                                                    style: GoogleFonts.rajdhani(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 15),
                                          child: GestureDetector(
                                            child: Container(
                                              height: 35,
                                              width: 85,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black,
                                                        blurRadius: 2.2,
                                                        spreadRadius: 0.0,
                                                        offset: Offset(1.0, 1.0))
                                                  ],
                                                  color: const Color.fromARGB(
                                                      255, 255, 17, 0),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: Text("Delete",
                                                      style: GoogleFonts.rajdhani(
                                                          color: Color.fromARGB(
                                                              255, 255, 255, 255),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600))),
                                            ),
                                          onTap: () {
                                            // 
                                            // 
                                            // 
                                            // 
                                            // 
                                            // 
                                            // 
                                            // 

                                          },),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );}
                     , itemCount: datas.length,
                    ))

                //
              ],
            ),
          ),
        ));
  }

  DateTime selectedDairyDate = DateTime.now();
  Future<void> selectDairyDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDairyDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDairyDate) {
      selectedDairyDate = picked;
      // DateTime now = DateTime.now();
      String formmattedDairyDate =
          DateFormat("yyyy-MM-dd").format(selectedDairyDate);
      DairyDatecontroller.text = formmattedDairyDate.toString();
    }
  }

  Future<dynamic> DiaryPageAlertBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (alert) => AlertDialog(
              title: Row(
                children: [
                  Text("Add Diaries"),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              //  insetPadding: EdgeInsets.zero,
              content: Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: DairyDatecontroller,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  selectDairyDate(context);
                                },
                                icon: Icon(Icons.date_range_outlined)),
                            hintText: "Enter Date",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: DairyNotecontroller,
                        keyboardType: TextInputType.multiline,
                        maxLines: 6,
                        minLines: 1,
                        decoration: InputDecoration(
                            hintText: "Enter Note",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 55,
                        width: 100,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 49, 51, 50),
                          child: Text("Update",
                              style: GoogleFonts.rajdhani(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            postDiaryData();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }


// 
// 
//      DIARY DATA GETTING API
// 
// 
  void getDiaryDetaills() async {
    final result = await Apiclass().myDiariyApi();
    setState(() {
      datas.addAll(result!.data!);
      // print("0000000000000000000000${}");
    });
  }



// 
// 
//      DIARY POSTING API
// 
// 

  void postDiaryData() async {
    print("7777777777777777777777777777777 function  ");
    final Date = DairyDatecontroller.text;
    final Note = DairyNotecontroller.text;
    if (Date.isEmpty) {
      showErrorMessage("Enter Date");
    } else if (Note.isEmpty) {
      showErrorMessage("Enter note");
    } else {
      final formmddata = FormData.fromMap({ "id":idDIary,
        "date": Date,
        "note":note});
      print("777777777777776666666666666666 function $formmddata");
      final result = await Apiclass().DiaryPostApi(formmddata);
      print("77777777777777722222222222222 function $result ");
      if (result != null) {
         print("77777777777777775555555555555 function ${result.status} ");
    
          showSuccessMessage("Done");
          Navigator.pop(context);
        
      }else {
         print("77777777777777775555555555555 function result us  null  ");
      }
      print("77777777777777775555555555555 function $result ");

      
    }
  }



// 
// 
//      DIARY DELETING API

// 
// 
void DiaryDeletFunction()async{
  final ID=  datas[index].id.toString();
  

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




// 
// 
// 
// ID store in variable  ,continue Delet Diary Post
// 
// 
// 