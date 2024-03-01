import 'package:flutter/material.dart';
import 'package:login_backend/Screens/doctor_schedule.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorSchedule()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset('assets/doctor.jpg', fit: BoxFit.cover),
                        ),
                      )
                            ,
                      SizedBox(width: 10,),
                      // SizedBox(
                      //   width: size.width * .1,
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Gurpreet Singh',
                            style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Experience :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("10 Years",style: TextStyle(fontSize:16,),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Fee :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("500 /-",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Mode :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("Online/Offline",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Designation :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("MBBS",style: TextStyle(fontSize:16,)),
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 19,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorSchedule()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset('assets/doctor2.jpg', fit: BoxFit.cover),
                        ),
                      )
                      ,
                      SizedBox(width: 10,),
                      // SizedBox(
                      //   width: size.width * .1,
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Akshay Arora',
                            style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Experience :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("15 Years",style: TextStyle(fontSize:16,),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Fee :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("700 /-",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Mode :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("Online",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Designation :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("MBBS,MD",style: TextStyle(fontSize:16,)),
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 19,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorSchedule()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset('assets/doctor3.jpg', fit: BoxFit.cover),
                        ),
                      )
                      ,
                      SizedBox(width: 10,),
                      // SizedBox(
                      //   width: size.width * .1,
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Bharti',
                            style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Experience :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("5 Years",style: TextStyle(fontSize:16,),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Fee :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("500 /-",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Mode :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("Online/Offline",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Designation :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("MBBS",style: TextStyle(fontSize:16,)),
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 19,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorSchedule()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset('assets/doctor4.jpg', fit: BoxFit.cover),
                        ),
                      )
                      ,
                      SizedBox(width: 10,),
                      // SizedBox(
                      //   width: size.width * .1,
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Aradhya',
                            style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Experience :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("10 Years",style: TextStyle(fontSize:16,),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Fee :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("500 /-",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Mode :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("Online/Offline",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Designation :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("MBBS",style: TextStyle(fontSize:16,)),
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 19,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorSchedule()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                        child: Container(
                          height: 120,
                          width: 120,
                          child: Image.asset('assets/doctor5.png', fit: BoxFit.cover),
                        ),
                      )
                      ,
                      SizedBox(width: 10,),
                      // SizedBox(
                      //   width: size.width * .1,
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Ankush Patil',
                            style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Experience :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("9 Years",style: TextStyle(fontSize:16,),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Fee :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("600 /-",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Mode :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("Offline",style: TextStyle(fontSize:16,)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Designation :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              Text("MD",style: TextStyle(fontSize:16,)),
                            ],
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 19,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Image.asset('assets/doctor.jpg', fit: BoxFit.cover),
                      ),
                    )
                    ,
                    SizedBox(width: 10,),
                    // SizedBox(
                    //   width: size.width * .1,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Gurpreet Singh',
                          style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Experience :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("10 Years",style: TextStyle(fontSize:16,),),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Fee :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("500 /-",style: TextStyle(fontSize:16,)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Mode :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("Online/Offline",style: TextStyle(fontSize:16,)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Designation :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("MBBS",style: TextStyle(fontSize:16,)),
                          ],
                        )
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 19,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Image.asset('assets/doctor.jpg', fit: BoxFit.cover),
                      ),
                    )
                    ,
                    SizedBox(width: 10,),
                    // SizedBox(
                    //   width: size.width * .1,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Gurpreet Singh',
                          style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Experience :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("10 Years",style: TextStyle(fontSize:16,),),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Fee :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("500 /-",style: TextStyle(fontSize:16,)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Mode :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("Online/Offline",style: TextStyle(fontSize:16,)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Designation :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("MBBS",style: TextStyle(fontSize:16,)),
                          ],
                        )
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 19,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Image.asset('assets/doctor.jpg', fit: BoxFit.cover),
                      ),
                    )
                    ,
                    SizedBox(width: 10,),
                    // SizedBox(
                    //   width: size.width * .1,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Gurpreet Singh',
                          style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Experience :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("10 Years",style: TextStyle(fontSize:16,),),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Fee :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("500 /-",style: TextStyle(fontSize:16,)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Mode :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("Online/Offline",style: TextStyle(fontSize:16,)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Designation :- " ,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            Text("MBBS",style: TextStyle(fontSize:16,)),
                          ],
                        )
                      ],
                    ),

                  ],
                ),



              ],
            )
          ),
        ),
      ),
    );
  }

  Widget buildDocDes(Size size) {
    return Column(
      children: [
        Row(
                children: [
                  Image.asset('assets/doctor_image.png'),
                  SizedBox(
                    width: size.width * .1,
                  ),
                  Text(
                    'Dr. John\nCardiologist\n10 years\nExperience',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
        SizedBox(height: size.height*.015,)
      ],
    );
  }
}
