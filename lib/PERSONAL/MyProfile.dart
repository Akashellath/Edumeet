import 'dart:io';

import 'package:edumeet_project_irohub/CHAT/chatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  // PROFILE IMAGE PICKER
  File? _profileImage;

  Future<void> _pickProfileImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Choose from Gallery'),
                onTap: () {
                  _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a Photo'),
                onTap: () {
                  _getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }
  // END OF IMAGE PICKER FUNCTION

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
              size: 30,
            )),
        actions: [
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
        ],
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 234, 234, 234),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 234, 234, 234),
                child: Stack(
                  children: [
                    Positioned(
                        child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 17, 0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.2,
                              spreadRadius: 0.0,
                              offset: Offset(2.0, 2.0))
                        ],
                      ),
                    )),
                    Positioned(
                        top: 32,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 63,
                          child: GestureDetector(
                            onTap: _pickProfileImage,
                            child: _profileImage == null
                                ? CircleAvatar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 17, 0),
                                    radius: 55,
                                    backgroundImage: AssetImage(
                                        "Asset/FB_IMG_1659716185316.jpg"),
                                  )
                                : CircleAvatar(
                                    radius: 55,
                                    backgroundImage: FileImage(_profileImage!),
                                  ),
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height / 8.5,
                        width: MediaQuery.of(context).size.width / .83,
                        child: GestureDetector(
                          onTap: _pickProfileImage,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            child: Icon(
                              Icons.image,
                              size: 35,
                              color: Color.fromARGB(255, 166, 166, 166),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Akash",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        // color is applied to main screen when modal bottom screen is displayed
                        // barrierColor: Colors.greenAccent,
                        //background color for modal bottom screen
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        //elevates modal bottom screen
                        elevation: 10,
                        // gives rounded corner to modal bottom screen
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        builder: (BuildContext context) {
                          // UDE : SizedBox instead of Container for whitespaces
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 2.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "First Name",
                                        hintStyle: GoogleFonts.rajdhani(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Middle Name",
                                        hintStyle: GoogleFonts.rajdhani(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Last Name",
                                        hintStyle: GoogleFonts.rajdhani(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 70,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 17, 0),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Save",
                                          style: GoogleFonts.rajdhani(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Reg.No :",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "123",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.2,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0))
                      ],
                      borderRadius: BorderRadius.circular(70),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 17, 0),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor:
                                const Color.fromARGB(255, 166, 166, 166),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Akash",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Parent",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.2,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0))
                      ],
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Gender",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Class",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Division",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Roll No",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "DOB",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Phone",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Male",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "4",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "A",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "12",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "23-07-2002",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "+91-9995664367",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.2,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0))
                      ],
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Email",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "secondry Phone no",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Address",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Place",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Post Code",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Blood Group",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "State",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Country",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Nationality",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "akash123@gmail.com",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "+91-9995664367",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "1st floor,trust ",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Kaloor",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "670693",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "O+",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Kerala",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "India",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Indian",
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
