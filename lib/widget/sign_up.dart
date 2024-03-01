import 'package:flutter/material.dart';
import 'package:login_backend/provider/login_manager.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int sex = -1;
  TextEditingController pno = TextEditingController(text:'+91');
  TextEditingController otp = TextEditingController();
  bool isvisible = false;
  List<Map<String, dynamic>> gender = [
    {'sex': 'Male', 'id': 1},
    {'sex': 'Female', 'id': 2},
    {'sex': 'Other', 'id': 3}
  ];
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<LoginManager>(context);
    return Container(
      height: 200,
      width: double.maxFinite,
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Visibility(
              visible: !manager.isvisible,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  TextField(
                    controller: pno,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Date of Birth',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        gender.map((value) => buildChoiceChip(value)).toList(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: manager.isvisible,
              child: Column(
                children: [
                  TextField(
                    controller: otp,
                    decoration: InputDecoration(
                      hintText: 'Enter OTP',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                manager.isvisible
                    ? manager.verifyOtp(otp.text,context)
                    : manager.loginWithPhone(pno.text, context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xffFCA136))
              ),
              child: Text(
                manager.isvisible ? 'Submit OTP' : 'Register',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ChoiceChip buildChoiceChip(Map<String, dynamic> value) {
    return ChoiceChip(
      padding: EdgeInsets.all(10),
      label: Text(
        value['sex'],
        style: TextStyle(fontSize: 22),
      ),
      selected: value['id'] == sex,
      onSelected: (_) => setState(() {
        sex = value['id'];
      }),
    );
  }
}
