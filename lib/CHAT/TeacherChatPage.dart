import 'package:flutter/material.dart';

class teachersChatPage extends StatefulWidget {
  const teachersChatPage({super.key});

  @override
  State<teachersChatPage> createState() => _teachersChatPageState();
}

class _teachersChatPageState extends State<teachersChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 217, 217),
      body: Center(child: Text("no Data")),
    );
  }
}
