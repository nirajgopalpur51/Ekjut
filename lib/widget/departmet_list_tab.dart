import 'package:flutter/material.dart';

import '../Screens/doctors_list.dart';

class DepartmentListTab extends StatefulWidget {
  const DepartmentListTab({Key? key}) : super(key: key);

  @override
  State<DepartmentListTab> createState() => _DepartmentListTabState();
}

class _DepartmentListTabState extends State<DepartmentListTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorsList()),
              );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 250,
                    width: 150,
                    child: Column(
                      children: [
                        Image.asset('assets/icu.jpg'),
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.red,
                          child: Center(child: Text("ICU",style: TextStyle(color: Colors.white,fontSize: 18),)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorsList()),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 250,
                    width: 150,
                    child: Column(
                      children: [
                        Image.asset('assets/2.png'),
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.red,
                          child: Center(child: Text("Phisiotherapy",style: TextStyle(color: Colors.white,fontSize: 18),)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // SizedBox(height: 10,),
          Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorsList()),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 250,
                    width: 150,
                    child: Column(
                      children: [
                        Image.asset('assets/emergency.jpg'),
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.red,
                          child: Center(child: Text("Emergency",style: TextStyle(color: Colors.white,fontSize: 18),)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorsList()),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 250,
                    width: 150,
                    child: Column(
                      children: [
                        Image.asset('assets/Radiology.jpg'),
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.red,
                          child: Center(child: Text("Radiology ",style: TextStyle(color: Colors.white,fontSize: 18),)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      )
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:login_backend/Screens/doctors_list.dart';
//
// class DepartmentListTab extends StatefulWidget {
//   const DepartmentListTab({Key? key}) : super(key: key);
//
//   @override
//   State<DepartmentListTab> createState() => _DepartmentListTabState();
// }
//
// class _DepartmentListTabState extends State<DepartmentListTab> {
//   @override
//   Widget build(BuildContext context) {
//
//
//     // Image myImage1 = Image.asset('assets/phisio.jpg');
//     // Image myImage2 = Image.asset('assets/img.png');
//     // Image myImage3 = Image.asset('assets/depa.png');
//     // Image myImage4 = Image.asset('assets/depa.png');
//     // Image myImage5 = Image.asset('assets/depa.png');
//     // Image myImage6 = Image.asset('assets/depa.png');
//     //
//     //
//     // Text myText1 = Text(
//     //   'PhisioTherapy',
//     //   style: TextStyle(
//     //     color: Colors.white,
//     //     fontSize: 18,
//     //   ),
//     // );
//     //
//     // Text myText2 = Text(
//     //   'PhisioTherapy',
//     //   style: TextStyle(
//     //     color: Colors.white,
//     //     fontSize: 18,
//     //   ),
//     // );
//     //
//     // Text myText3 = Text(
//     //   'PhisioTherapy',
//     //   style: TextStyle(
//     //     color: Colors.white,
//     //     fontSize: 18,
//     //   ),
//     // );
//     //
//     // Text myText4 = Text(
//     //   'PhisioTherapy',
//     //   style: TextStyle(
//     //     color: Colors.white,
//     //     fontSize: 18,
//     //   ),
//     // );
//     //
//     // Text myText5 = Text(
//     //   'PhisioTherapy',
//     //   style: TextStyle(
//     //     color: Colors.white,
//     //     fontSize: 18,
//     //   ),
//     // );
//     // Text myText6 = Text(
//     //   'PhisioTherapy',
//     //   style: TextStyle(
//     //     color: Colors.white,
//     //     fontSize: 18,
//     //   ),
//     // );
//
//
// // Call buildDepartment function
// //     Container departmentContainer1 = buildDepartment(
// //       // MediaQuery.of(context).size, // Pass the size of the screen
// //       // context, // Pass the BuildContext
// //       myImage1, // Pass the image widget
// //       myText1, // Pass the text widget
// //     );
// //
// //     Container departmentContainer2 = buildDepartment(
// //       // MediaQuery.of(context).size, // Pass the size of the screen
// //       // context, // Pass the BuildContext
// //       myImage2, // Pass the image widget
// //       myText2, // Pass the text widget
// //     );
// //
// //     Container departmentContainer3 = buildDepartment(
// //       // MediaQuery.of(context).size, // Pass the size of the screen
// //       // context, // Pass the BuildContext
// //       myImage3, // Pass the image widget
// //       myText3, // Pass the text widget
// //     );
// //
// //     Container departmentContainer4 = buildDepartment(
// //       // MediaQuery.of(context).size, // Pass the size of the screen
// //       // context, /// Pass the BuildContext
// //       myImage4, // Pass the image widget
// //       myText4, // Pass the text widget
// //     );
// //
// //     Container departmentContainer5 = buildDepartment(
// //       // MediaQuery.of(context).size, // Pass the size of the screen
// //       // context, // Pass the BuildContext
// //       myImage5, // Pass the image widget
// //       myText5, // Pass the text widget
// //     );
// //     Container departmentContainer6 = buildDepartment(
// //       // MediaQuery.of(context).size, // Pass the size of the screen
// //       // context, // Pass the BuildContext
// //       myImage6, // Pass the image widget
// //       myText6, // Pass the text widget
// //     );
//
//
//
//     // Size size = MediaQuery.of(context).size;
//     // return Wrap(
//     //
//     //   alignment: WrapAlignment.spaceAround,
//     //   spacing: size.width * 0.05 ,
//     //   runSpacing: size.height * .025,
//     //   children: [
//     //     departmentContainer1,
//     //     departmentContainer2,
//     //     departmentContainer3,
//     //     departmentContainer4,
//     //     departmentContainer5,
//     //     departmentContainer6,
//
//
//         // buildDpartment(size, context),
//         // buildDpartment(size, context),
//         // buildDpartment(size, context),
//         // buildDpartment(size, context),
//         // buildDpartment(size, context),
//         // buildDpartment(size, context),
//     //   ],
//     // );
//   }
//
//   Container buildDepartment( Image i, Text t) {
//     return Container(
//       height: 168,
//       width: 150,
//       // height: size.height * 0.209,
//       // width: size.width * 0.36,
//         color: Color(0xFF00B48B),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           i, // Image widget passed as a parameter
//           SizedBox(height: 10), // Add some spacing between image and button
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => DoctorsList()),
//               );
//             },
//             // style: TextButton.styleFrom(
//             //   backgroundColor: Colors.transparent, // Make button transparent
//             // ),
//             child: t, // Text widget passed as a parameter
//           ),
//         ],
//       ),
//     );
//   }
//
// }
