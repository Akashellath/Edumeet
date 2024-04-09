import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Time Table ",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      
    );
  }
}
