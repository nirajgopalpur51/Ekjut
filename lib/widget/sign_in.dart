import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/login_manager.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController pno = TextEditingController(text:  '+91');
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<LoginManager>(context);
    return Container(
      height: 200,
      width: double.maxFinite,
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Visibility(
            visible: manager.isvisible,
            child: Column(
              children: [
                TextField(
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
              backgroundColor: MaterialStateProperty.all(Color(0xffFCA136))
            ),
            child: Text(
              manager.isvisible ? 'Submit OTP' : 'Request OTP',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
