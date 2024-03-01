import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_backend/otpScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController no = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController gender = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIdReceived = '';

  Future<bool> loginWithPhone() async{
    await auth.verifyPhoneNumber(
        phoneNumber: no.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print(credential);
          await auth
              .signInWithCredential(credential)
              .then((_) => print('logged in 1'));
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          print('verid :$verificationId');
          verificationIdReceived = verificationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Otp(verificationID: verificationId),
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {}).then((value) => true);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: name,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: no,
              decoration: InputDecoration(hintText: 'Mobile Number'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: dob,
              decoration: InputDecoration(hintText: 'Date of birth'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: gender,
              decoration: InputDecoration(hintText: 'Gender'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loginWithPhone();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
