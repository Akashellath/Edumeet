import 'package:edumeet_project_irohub/APIs&URLs/ApiClass.dart';
import 'package:edumeet_project_irohub/CHAT/chatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  var EventPageData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetEventData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 234, 234),
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
            title: Text("Event",
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
        body: ListView.builder(
            itemCount: EventPageData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 10, left: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.8,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Test evevt",
                                      style: GoogleFonts.rajdhani(
                                        color: Color.fromARGB(255, 88, 87, 87),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Type :",
                                          style: GoogleFonts.rajdhani(
                                            color:
                                                Color.fromARGB(255, 88, 87, 87),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          EventPageData[index].type,
                                          style: GoogleFonts.rajdhani(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Date :",
                                          style: GoogleFonts.rajdhani(
                                            color:
                                                Color.fromARGB(255, 88, 87, 87),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          EventPageData[index].start_date,
                                          style: GoogleFonts.rajdhani(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Ex Date :",
                                          style: GoogleFonts.rajdhani(
                                            color:
                                                Color.fromARGB(255, 88, 87, 87),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          EventPageData[index].exp_date,
                                          style: GoogleFonts.rajdhani(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Class & Division :",
                                          style: GoogleFonts.rajdhani(
                                            color:
                                                Color.fromARGB(255, 88, 87, 87),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          EventPageData[index].division,
                                          style: GoogleFonts.rajdhani(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Time :",
                                          style: GoogleFonts.rajdhani(
                                            color:
                                                Color.fromARGB(255, 88, 87, 87),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          EventPageData[index].time,
                                          style: GoogleFonts.rajdhani(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
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
            }));
  }

  void GetEventData() async {
    final result = await Apiclass().EventPageApi();
    setState(() {
      EventPageData.addAll(result!.data);
      print(
          "rreeeeeeeeeeeeeeeeeeeeeeesssssssssssssssssssssssssssuuuuuuuuuuuuuuuuuuuulllllllllllllllllltttttttt${result.data}");
    });
  }
}
