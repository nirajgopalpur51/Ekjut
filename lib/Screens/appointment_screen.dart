import 'package:flutter/material.dart';

import '../widget/appointment_tab.dart';
import '../widget/history_tab.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          bottom: TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.green,
              tabs: const [
                Tab(
                  text: 'appoiment',
                ),
                Tab(
                  text: 'history',
                ),
              ],),
        ),
        body: TabBarView(children: [
          AppoimentTab(),
          HistoryTab(),
        ],),
      ),
    );
  }
}
