import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class noticePage extends StatefulWidget {
  var titlename;
  noticePage({super.key });

  @override
  State<noticePage> createState() => _noticePageState();
}

class _noticePageState extends State<noticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            )),
        backgroundColor: Color.fromARGB(255, 255, 17, 0),
        title: Text(
          "Notice",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 18),
                child: Text(
                  "Title",
                  style: GoogleFonts.rajdhani(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "data",
                  style: GoogleFonts.rajdhani(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  "Description",
                  style: GoogleFonts.rajdhani(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "data",
                  style: GoogleFonts.rajdhani(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
