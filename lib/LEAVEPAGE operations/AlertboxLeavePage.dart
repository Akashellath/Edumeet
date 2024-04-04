import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var categorycontroller = TextEditingController();
var StartingDateController = TextEditingController();
var StartingTimeController = TextEditingController();
var EndDateController = TextEditingController();
var EndTimeController = TextEditingController();
var Reasoncontroller = TextEditingController();
DateTime selectedDate = DateTime.now();

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
  }
}

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
                      child: TextField(controller: StartingDateController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                icon: Icon(Icons.calendar_month_outlined)),
                            hintText: "Starting Date",
                            hintStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(controller: StartingTimeController,
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
                      child: TextField(controller: EndDateController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                icon: Icon(Icons.calendar_month_outlined)),
                            hintText: "End Date",
                            hintStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(controller: EndTimeController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.timer_outlined)),
                            hintText: "End Time",
                            hintStyle: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(controller: Reasoncontroller,
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
                          style: TextStyle(
                            fontSize: 20,
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
