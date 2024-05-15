import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edumeet_project_irohub/APIs&URLs/ApiClass.dart';
import 'package:edumeet_project_irohub/CHAT/chatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  String parentimgg = "";
  String Gender = "";
  String STD = "";
  String Division = "";
  String RollNo = "";
  String DoB = "";
  String PhoneNo = "";
  String Email = "";
  String SecondaryPhone = "";
  String Address = "";
  String Place = "";
  String PostCode = "";
  String BloodGroup = "";
  String State = "";
  String Country = "";
  String Nationaliy = "";
  String Username = "";
  String ImgUrl = "";
  String FirstName = "";
  String Middlename = "";
  String Lastname = "";
  String Parent = "";
  var firstnamecontroller = TextEditingController();
  var secondnamecoldroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myprofilepage();
    LoadparentImg();
  
  }

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
        EditprofileimgPost(_profileImage);
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
        color: Color(0xFFEAEAEA),
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
                                    backgroundImage: NetworkImage(
                                      ImgUrl,
                                    )
                                    //  AssetImage(
                                    //     "Asset/FB_IMG_1659716185316.jpg"),
                                    // NetworkImage(ImgUrl),
                                    // Image.network(ImgUrl)
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
                    FirstName,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(Middlename,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(Lastname,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 5,
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
                                    controller: firstnamecontroller,
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
                                    controller: secondnamecoldroller,
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
                                    controller: lastnamecontroller,
                                    decoration: InputDecoration(
                                        hintText: "Last Name",
                                        hintStyle: GoogleFonts.rajdhani(
                                            fontWeight: FontWeight.bold),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        EditProfilenmePost();
                                      },
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
                                      ),
                                    ))
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
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
                            backgroundImage: NetworkImage("$parentimgg"),
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
                                Parent,
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
                                    Gender,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    STD,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Division,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    RollNo,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    DoB,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    PhoneNo,
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
                                      softWrap: false,
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
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                Email,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.rajdhani(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Text(
                                    SecondaryPhone,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                Address,
                                // overflow: TextOverflow.visible,
                                // overflow: TextOverflow.ellipsis,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.rajdhani(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Text(
                                    Place,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    PostCode,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    BloodGroup,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    State,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Country,
                                    style: GoogleFonts.rajdhani(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Nationaliy,
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

  void LoadparentImg() async {
    "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      parentimgg = sharedPreferences.getString("image1") ?? "";
      print(
          "llllllllllllllllllllllllllllllllllllllllllllllllllllll  $parentimgg");
    });
  }

  void myprofilepage() async {
    print(
        "aaaaaaaaaaaaaaaaaaaaaaaakkkkkkkkkkkkkkkkkkkkkkkkaaaaaaaaaaaaaaaassssssssssssshhhhhhhhhhhh");
    final result = await Apiclass().MyProfilepageApi();
    print(
        "reeeeeeesssssssssssssssssssssssssssuuuuuuuuuuuuuuuuuuuuuuuuuuullllllllllllllllttttttttttttt$result");
    setState(() {
      Gender = result!.data.gender;
      STD = result.data.classname.name;
      Division = result.data.division.toString();
      RollNo = result.data.rollNumber.toString();
      DoB = result.data.dob;
      PhoneNo = result.data.phone.toString();
      Email = result.data.email;
      SecondaryPhone = result.data.phone2;
      Address = result.data.address;
      Place = result.data.place;
      PostCode = result.data.code;
      BloodGroup = result.data.blood;
      State = result.data.states.name;
      Country = result.data.countries.name;
      Nationaliy = result.data.nationality;
      Username = result.data.username;
      ImgUrl = result.data.profileImageUrl;
      FirstName = result.data.firstName;
      Middlename = result.data.middleName;
      Lastname = result.data.lastName;
      Parent = result.data.parents.firstName;
      print(
          "akkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$ImgUrl");
    });
  }

  void EditProfilenmePost() async {
    final Firstnname = firstnamecontroller.text;
    final Secondname = secondnamecoldroller.text;
    final Lastname = lastnamecontroller.text;
    if (Firstnname.isEmpty) {
      showErrorMessage("Enter first name");
    } else if (Secondname.isEmpty) {
      showErrorMessage("enter second name");
    } else if (Lastname.isEmpty) {
      showErrorMessage("Enter last name ");
    } else {
      final formdata = FormData.fromMap({
        "first_name": Firstnname,
        "middle_name": Secondname,
        "last_name": Lastname
      });
      final result = await Apiclass().EditProfileNameApi(formdata);
      if (result != null) {
        if (result.status == 1) {
          showSuccessMessage("Name changed Sucsessfully");
        }
      } else {
        showErrorMessage("operation Failed");
      }
    }
  }

  void EditprofileimgPost(prof) async {print("tttttttttttttttttttttttttttttttttttttttttt");
    final profile_image = _profileImage;
    print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv$prof");
    final formData = FormData.fromMap({"profile_image": prof});
    final result = await Apiclass().EditProfileimgApi(formData);
    print("fffffffffffffffffffffffffffffffffffffffffff helloooooiii $result");
    if (result != null) {
      if (result.status == 1) {
        showSuccessMessage("Image uploaded");
      } else {
        showErrorMessage("operation failed");
      }
    }
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
