// import 'package:flutter/material.dart';
//
// import '../../class/allClass.dart';
//
// List<Map<String, dynamic>> AllAttendance = [];
//
// class Attendance extends StatefulWidget {
//   const Attendance({Key? key}) : super(key: key);
//
//   @override
//   State<Attendance> createState() => _AttendanceState();
// }
//
// class _AttendanceState extends State<Attendance> {
//   DateTime date = DateTime.now();
//
//   bool colorData = true;
//   bool changeBox = true;
//   String? detail;
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Attendance",
//             style: TextStyle(
//                 letterSpacing: 2, fontSize: SizeConfig.screenHeight * 0.025, fontWeight: FontWeight.w400)),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 showModalBottomSheet<void>(
//                   context: context,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(25.0),
//                     ),
//                   ),
//                   builder: (BuildContext context) {
//                     return (AllAttendance.isNotEmpty)
//                         ? Column(
//                       children: [
//                         // ListView.builder(
//                         //   itemCount: AllAttendance.length,
//                         //     itemBuilder: (context, i) {
//                         //       return Container(
//                         //         child: Column(
//                         //           children: [
//                         //             Text("${AllAttendance[i]['day']}"),
//                         //             Text("${AllAttendance[i]['month']}"),
//                         //             Text("${AllAttendance[i]['year']}"),
//                         //           ],
//                         //         ),
//                         //       );
//                         //     })
//                         ...AllAttendance.map((e) {
//                           return Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Container(
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       color: Colors.green,
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             "${e['day']} / ${e['month']} / ${e['year']}",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 19),
//                                           ),
//                                           Spacer(),
//                                           Text(
//                                             "${e['attendance']}",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 19),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                         }).toList(),
//                       ],
//                     ) : Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                     Center(
//                     child: Image.asset(
//                       "assets/images/no-data.png",
//                       height: 70,
//                        )),
//                       Text("No Data Found...")
//                       ],
//                     );
//                   },
//                 );
//               },
//               icon: Icon(Icons.padding))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             (changeBox == true)
//                 ? GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         colorData = false;
//                         // detail = date.day.toString();
//                         Map<String, dynamic> attendance = {
//                           'day': date.day,
//                           'month': date.month,
//                           'year': date.year,
//                           'attendance': "P",
//                         };
//                         AllAttendance.add(attendance);
//                         changeBox = false;
//                       });
//                     },
//                     child: Container(
//                       height: 60,
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: (colorData == true)
//                               ? Colors.white
//                               : Colors.green),
//                       child: Text(
//                         "${date.day} / ${date.month} / ${date.year}",
//                         style: TextStyle(
//                             fontSize: 23, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   )
//                 : Container(
//                     height: 60,
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.green),
//                     child: Text(
//                       "${date.day} / ${date.month} / ${date.year}",
//                       style:
//                           TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
