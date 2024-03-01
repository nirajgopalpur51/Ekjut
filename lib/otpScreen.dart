import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
  Otp({Key? key,required this.verificationID}) : super(key: key);
  final verificationID;


  void verifyOtp()async{
    print('verid :$verificationID');
    PhoneAuthCredential credential=PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otp.text);
    await FirebaseAuth.instance.signInWithCredential(credential).then((_) => print('logged in 2'));
  }

  TextEditingController otp=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: otp,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){verifyOtp();},
        child: Icon(Icons.add),
      ),
    );
  }
}
