import 'package:edumeet_project_irohub/APIs&URLs/ApiClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Asssingdleave extends StatefulWidget {
  const Asssingdleave({super.key});

  @override
  State<Asssingdleave> createState() => _AsssingdleaveState();
}

class _AsssingdleaveState extends State<Asssingdleave> {
  var AssigneleaveList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAssingedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 226, 223, 223),
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 226, 223, 223),
              child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(AssigneleaveList[index].name,
                                    style: GoogleFonts.rajdhani(
                                        color: Color.fromARGB(255, 99, 98, 98),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                Text(AssigneleaveList[index].id),
                                Text("Days"),
                              ],
                            ),
                          ),
                        ),
                      ),
                  itemCount: AssigneleaveList.length
                  //  AssigneleaveList.length,
                  ))

          //
        ],
      ),
    ));
  }

  void GetAssingedData() async {
    final result = await Apiclass().AssignedPageApi();
    setState(() {
      AssigneleaveList.addAll(result!.data);
    });
  }
}
