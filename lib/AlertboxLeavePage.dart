import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var category = ["Sick", "Casual", "etc"];
Future<dynamic> LeaveApplicationAlertbox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (alert) => AlertDialog(
            title: Row(
              children: [
                Text(
                  "Leave Application",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
            insetPadding: EdgeInsets.zero,
            // overflow: Overflow.visible,
            content: Container(
              width: MediaQuery.of(context).size.width / 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            hintText: "Category",
                            hintStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder()),
                        items: category.map((String category) {
                          return new DropdownMenuItem(
                              value: category, child: Text(category));
                        }).toList(),
                        onChanged: (String? newValue) {
                          // do other stuff with _category
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_month_outlined)),
                            hintText: "Starting Date",
                            hintStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.timer_outlined)),
                            hintText: "Starting Time",
                            hintStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_month_outlined)),
                            hintText: "End Date",
                            hintStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_month_outlined)),
                            hintText: "End Time",
                            hintStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        minLines: 1,
                        decoration: InputDecoration(
                            labelText: "Reason",
                            labelStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),

                            // contentPadding:
                            // EdgeInsets.symmetric(vertical: 40.0)
                            border: OutlineInputBorder()),
                      ),
                    ),

                    // SUBMIT BUTTON

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(31, 17, 17, 17),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: [],
          ));
}
