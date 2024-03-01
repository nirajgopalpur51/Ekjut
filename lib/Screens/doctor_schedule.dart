import 'package:flutter/material.dart';
import 'package:login_backend/widget/hospital_visit.dart';
import 'package:login_backend/widget/popup.dart';
import 'package:login_backend/widget/video_consult.dart';

class DoctorSchedule extends StatefulWidget {
  const DoctorSchedule({Key? key}) : super(key: key);

  @override
  State<DoctorSchedule> createState() => _DoctorScheduleState();
}

class _DoctorScheduleState extends State<DoctorSchedule>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                    child: Container(
                      height: 140,
                      width: 140,
                      child: Image.asset('assets/doctor.jpg', fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Gurpreet Singh',
                        style: TextStyle(color:Colors.red,fontSize: 18.5,fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Experience :- " ,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                          Text("10 Yrs",style: TextStyle(fontSize:16,),),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Fee :- " ,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                          Text("500 /-",style: TextStyle(fontSize:16,)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Mode :- " ,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                          Text("Online/Off",style: TextStyle(fontSize:16,)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Designation :- " ,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                          Text("MBBS",style: TextStyle(fontSize:16,)),
                        ],
                      )
                    ],
                  ),
                  // SizedBox(height: 20,),
                  // Text(
                  //   'Dr. John\nCardiologist\n10 years\nExperience',
                  //   style: TextStyle(fontSize: 22),
                  // ),
                ],
              ),
              SizedBox(height: 10,),
              TabBar(
                // isScrollable: true,
                indicatorPadding: EdgeInsets.all(10),
                labelColor: Color(0xff00B48B),
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 30),
                labelPadding:
                    EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15),
                controller: _tabController,
                indicatorColor: Color(0xff00B48B),
                tabs: [
                  Text('Hospital\n   Visit',style: TextStyle(fontSize: 24),),
                  Text('  Video\nConsult',style: TextStyle(fontSize: 24),),
                ],
              ),
              Container(
                height: size.height * .52,
                //color: Colors.amber,
                child: TabBarView(
                    controller: _tabController,
                    children: [HospitalVisitTab(), VideoConsultTab()]),
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (BuildContext context)=>Popup());
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffFCA136))),
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
