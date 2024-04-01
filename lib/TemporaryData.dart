
//  ExpansionTile(
//       leading: leadicon,
//       title: Text("$title",
//           style:
//               GoogleFonts.rajdhani(fontSize: 20, fontWeight: FontWeight.w500)),
//       trailing: trailicon,
//       children: [
//         Column(
//           children: [
//             ExpntTIleWidget(TitleOfLstTle: "My profile"),
//             ExpntTIleWidget(TitleOfLstTle: "My Diaries"),
//             ExpntTIleWidget(TitleOfLstTle: "My profile"),
//             ExpntTIleWidget(TitleOfLstTle: "Staff Directory"),
//             ExpntTIleWidget(TitleOfLstTle: "Celender"),
//             listtilewidget(
//               title: "Leave Appilication",
//               trailicon: Icon(Icons.keyboard_arrow_down_outlined),
//             )
//           ],
//         )
//       ],
//     );





        //  listtilewidget(
        //     title: "Dashbord",
        //     leadicon: Icon(Icons.dashboard_outlined),
        //   ),
        //   listtilewidget(
        //     title: "Personal",
        //     leadicon: Icon(Icons.how_to_reg_outlined),
        //     trailicon: Icon(Icons.keyboard_arrow_down_outlined),
        //   ),
        //   listtilewidget(
        //     title: "Acadamic",
        //     leadicon: Icon(Icons.school_outlined),
        //     trailicon: Icon(Icons.keyboard_arrow_down_outlined),
        //   )
  


  
// class listtilewidget extends StatelessWidget {
//   String? title;
//   Icon? leadicon;
//   Icon? trailicon;
//   listtilewidget(
//       {super.key, required this.title, this.leadicon, this.trailicon});

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       leading: leadicon,
//       title: Text("$title",
//           style:
//               GoogleFonts.rajdhani(fontSize: 20, fontWeight: FontWeight.w500)),
//       trailing: trailicon,
//       children: [
//         Column(
//           children: [
//             GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Myprofile(),
//                       ));
//                 },
//                 child: ExpntTIleWidget(TitleOfLstTle: "My profile")),
//             GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DiaryPage(),
//                       ));
//                 },
//                 child: ExpntTIleWidget(TitleOfLstTle: "My Diaries")),
//             GestureDetector(
//                 child: ExpntTIleWidget(TitleOfLstTle: "My profile")),
//             GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => StaffDirectory(),
//                       ));
//                 },
//                 child: ExpntTIleWidget(TitleOfLstTle: "Staff Directory")),
//             ExpntTIleWidget(TitleOfLstTle: "Celender"),
//             listtilewidget(
//               title: "Leave Appilication",
//               trailicon: Icon(Icons.keyboard_arrow_down_outlined),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

// class ExpntTIleWidget extends StatelessWidget {
//   String? TitleOfLstTle;
//   ExpntTIleWidget({super.key, required this.TitleOfLstTle});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("$TitleOfLstTle",
//           style:
//               GoogleFonts.rajdhani(fontSize: 15, fontWeight: FontWeight.w500)),
//     );
//   }
// }

// ccell expantiion or list tile expantion
//
// overflow elipse
