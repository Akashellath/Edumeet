import 'package:edumeet_project_irohub/APIs&URLs/ApiClass.dart';
import 'package:edumeet_project_irohub/DrawerSettings.dart';
import 'package:edumeet_project_irohub/CHAT/chatPage.dart';
import 'package:edumeet_project_irohub/SharedPreference/SharedPreference.dart';

import 'package:edumeet_project_irohub/noticePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class profilePaeg extends StatefulWidget {
  const profilePaeg({super.key});

  @override
  State<profilePaeg> createState() => _profilePaegState();
}

class _profilePaegState extends State<profilePaeg> {
  var noticeTitle = [
    "Programming contest",
    "Parents meeting",
    "College day",
    "College election",
    "Arts felstival"
  ];
  var noticeDetails = [
    """The international collegiate Programming contest 
    is an algorith programming contest for college 
    stdents.Team of three,representing their university,
    work to slove the most real-world problems,fostering
    collabration ,creativity, innovation ,and the ability 
    to perform under pressure .Through traning and 
    competiotion ,teams challengs each others to raise
    the bar on the possible .quite simply,it is the oldest ,
    largest ,and most prestigious programming contest in the world """,
    """PTA addresses issues that are important to parents and 
    public school administratos. We fight for fouonding ,
    qualitie teachers,and capabilities  for school to thrive.
    If your school or district does not have a PTA.now is 
    the time .Membership is open to everyone .Your PTA is 
    autonomus but supported by a nation structure .it 
    sets its own dues   """,
    """The annual college day celebration is  organised by 
    the management .student with great intres and 
    enthusiasam .The day is celebrated during the firsthalf
    of the acadamic session. It provides an opportunity to 
    assess the acheivements of the college.The students 
    are actively associated in on the segment of the 
     programme. Rather , the manage all the ativities by 
     themselves .As this day falls right next to the sports day 
     celebration,the enegry and the spirit of the studnent 
     always stays hi ,""",
    """The are many elected roles availabale, with some 
    requiring greater involvement than other.While
    societies and sports clubs host voluntary elected 
    positions to run alongside your stidies , the students'
    union offers numerous paid .full-time sabbatical roles 
    -such as president ,vice president,education officer 
    and welfare office -that can be held for one or two 
    years   """,
    """The college gives equal importance to  academic 
    and non acadamic area. the college Arts festival is 
    conductud each year wit unique names .in order to 
    ensure  the maximum participation from every student 
    and to include in them a spirit of competetion ,all the 
    students are grouped into four houses.Each group is 
    headed by respective teachers."""
  ];
  String firstnam = "";
  String middlename="";
  String Lastname="";
  String regno = "";
  String clss = "";
  String Dateofbirth = "";
  String divsn = "";
  String parentnam = "";
   String code = "";
    String parent = "";
     String profileimaageUrl= "";
     String profileImage="";
     String ParentProfileImg="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Dashboardpagedetails();
    // saveNameData();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 237, 236, 236),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.sort_outlined,
                color: Colors.white,
              )),
          centerTitle: true,
          title: Text("EDUMEET",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Colors.white,
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
          backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
      drawer: drawerwidget(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.2,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0))
                  ],
                  color: Color.fromARGB(255, 255, 17, 0),
                  // borderRadius:
                  // BorderRadiusDirectional.vertical(
                  //     bottom: Radius.elliptical(
                  //         MediaQuery.of(context).size.width, 100.0))
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(300, 90))),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50, left: 20, right: 20, bottom: 50),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 270,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 3.2,
                                    spreadRadius: 0.0,
                                    offset: Offset(3.0, 3.0))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 75,
                              ),
                              Center(
                                child: Text(
                                  firstnam,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Reg.no:",
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(regno,
                                      style: GoogleFonts.rajdhani(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Class-",
                                              style: GoogleFonts.rajdhani(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)

                                              // TextStyle(
                                              //   fontSize: 18,
                                              // ),
                                              ),
                                          Text(clss,
                                              style: GoogleFonts.rajdhani(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Roll no:",
                                              style: GoogleFonts.rajdhani(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                          Text("7",
                                              style: GoogleFonts.rajdhani(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Center(
                                    child: Container(
                                      height: 45,
                                      width: 1,
                                      color:
                                          const Color.fromARGB(255, 71, 71, 71),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("   Division-",
                                              style: GoogleFonts.rajdhani(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)

                                              // TextStyle(
                                              //   fontSize: 18,
                                              // ),
                                              ),
                                          Text(divsn,
                                              style: GoogleFonts.rajdhani(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(" DOB:",
                                              style: GoogleFonts.rajdhani(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                          Text(Dateofbirth,
                                              style: GoogleFonts.rajdhani(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Material(
                          borderRadius: BorderRadius.circular(59),
                          color: Colors.black,
                          elevation: 10,
                          shadowColor: Colors.black,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(profileimaageUrl),
                            backgroundColor: Colors.amber,
                            radius: 60,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 17, 0),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            ParentProfileImg,
                          ),
                          radius: 48,
                          backgroundColor: Color.fromARGB(255, 244, 241, 240),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(parentnam,
                        style: GoogleFonts.rajdhani(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w400)),
                  ),
                  Text("Parent",
                      style: GoogleFonts.rajdhani(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, bottom: 30),
              child: Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              size: 32,
                              color: const Color.fromARGB(255, 246, 193, 2),
                            ),
                            Text("Notice",
                                style: GoogleFonts.rajdhani(
                                    fontSize: 22, fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => noticePage(
                                          titlename: noticeTitle[index],
                                          noticeDetaling: noticeDetails[index],
                                        ),
                                      ));   print(
                                            "nooooooooottttttiiiicccceeeeeeepppppaaaggggggee$noticeTitle");
                                },
                                child: ListTile(
                                  title: Text(
                                    noticeTitle[index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                      overflow: TextOverflow.ellipsis,
                                      noticeDetails[index]),
                                  trailing: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  noticePage(),
                                            ));
                                     
                                      },
                                      icon:
                                          Icon(Icons.arrow_forward_ios_sharp)),
                                ),
                              ),
                          separatorBuilder: (context, index) => Divider(
                              color: Color.fromARGB(255, 173, 172, 172)),
                          itemCount: noticeTitle.length),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void Dashboardpagedetails() async {print("ooooooooooooooooooooooooooooooooooooooooooooookk");
    print(
        "aaaaaaaaaaaaasasaassasasasasasasasasasasasasasasasasasssssssssasasasasasa");
    final result = await Apiclass().DashBoardApi();
    print("asdfghjklasdfghjklasdfghjkl");
    setState(() {
    firstnam=result!.student.firstName +" "+result.student.middleName+" "+result.student.lastName;
    // middlename=result.student.middleName;
    // Lastname=result.student.lastName;
    regno=result.student.regNumber;
    clss=result.student.classname.name;
    divsn=result.student.divisions.name;
    parentnam=result.student.parents.firstName + " " + result.student.parents.lastName;
    
    // parentnam=result.student.parents.imageUrl;
    profileimaageUrl=result.student.profileImageUrl;
profileImage=result.student.profileImage;
ParentProfileImg=result.student.parents.imageUrl;
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm$profileimaageUrl");
      saveNameData;
      saveProfileImage(profileimaageUrl);
    });
  }
  


 





}
