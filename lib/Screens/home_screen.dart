import 'package:flutter/material.dart';
import 'package:login_backend/widget/departmet_list_tab.dart';
import 'package:login_backend/widget/recources_list_tab.dart';

import '../resources_call.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this,)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10)
                ),

                  child :ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(180), // Image radius
                      child: Image.asset('assets/hospital1.png', fit: BoxFit.cover),
                    ),
                  )

                // child: ClipOval(
                //   child: SizedBox.fromSize(
                //     size: Size.fromRadius(180), // Image radius
                //     child: Image.asset('assets/hospital1.png', fit: BoxFit.cover),
                //   ),
                // ),
                // child: Image.asset('assets/hospital1.png'),
              ),

              SizedBox(
                height: size.height * .015,
              ),
              Row(
                children: [
                  Text("MM SUPER SPECILITY HOSPITAL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.red),),
                  // Text("From 9:00A.M -5:00 P.M",style: TextStyle(fontSize: 20),)
                ],
              ),
              SizedBox(
                height: size.height * .015,
              ),
              Row(
                children: [
                  Text("Location :- ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("Mullana, Ambala",style: TextStyle(fontSize: 20),)
                ],
              ),
              Row(
                children: [
                  Text("Timings :- ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("From 9:00A.M -5:00 P.M",style: TextStyle(fontSize: 20),)
                ],
              ),
              Row(
                children: [
                  Text("Emergency Timings :- ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("Open 24 Hours",style: TextStyle(fontSize: 20),)
                ],
              ),
              Row(
                children: [
                  Text("Contact :- ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("6200856425",style: TextStyle(fontSize: 20),)
                ],
              ),
              SizedBox(height: 10,),

              Card(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(12),
                // ),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: TabBar(
                    // indicator: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   color: Colors.orange,
                    // ),
                    controller: _tabController,
                    indicatorColor: Colors.red,
                    // indicatorPadding: EdgeInsets.all(5),
                    // isScrollable: true,
                    // labelPadding: EdgeInsets.only( right: 25, top: 15, bottom: 10),
                    // labelPadding: EdgeInsets.symmetric(horizontal: 30),
                    // labelStyle: TextStyle(fontSize: 250008),
                    tabs: [
                      Tab(child: Text("Department",style: TextStyle(color: Colors.black,fontSize: 22),),),
                      // Tab(child: Text("Resources",style: TextStyle(color: Colors.black)),),
                      Tab(child: Text("Resources",style: TextStyle(color: Colors.black,fontSize: 22)),)
                    ],
                  ),
                ),
              ),

              // TabBar(
              //   isScrollable: true,
              //   indicatorPadding: EdgeInsets.all(5),
              //   labelColor: Color(0xff00B48B),
              //   unselectedLabelColor: Colors.black,
              //   labelStyle: TextStyle(fontSize: 28),
              //   labelPadding: EdgeInsets.only(left: 0, right: 25, top: 15, bottom: 10),
              //   controller: _tabController,
              //   indicatorColor: Color(0xff00B48B),
              //   tabs: [
              //     Text('Department'),
              //     Text('Resources'),
              //   ],
              // ),
              Container(
                //color: Colors.amber,
                width: size.width,
                height: size.height,
                child: TabBarView(controller: _tabController, children:[
                  DepartmentListTab(),
                  communitypage(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
