import 'package:flutter/material.dart';
import 'package:login_backend/widget/sign_in.dart';
import 'package:login_backend/widget/sign_up.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// ignore: camel_case_types
class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  Color colorstheme = Colors.green;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery
        .of(context)
        .size;
    double h = _size.height;
    double w = _size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: h * 0.8,
          margin: EdgeInsets.only(top: h * 0.3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: TabBar(
                  isScrollable: true,
                  indicatorPadding: EdgeInsets.all(10),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 30),
                  labelPadding:
                  EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15),
                  indicator: BoxDecoration(
                      color: colorstheme,
                      borderRadius: BorderRadius.circular(10)),
                  controller: _tabController,
                  tabs: [
                    Text('Sign Up'),
                    Text('Sign In'),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SignUp(),
                    SignIn()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

