import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_backend/navigation.dart';

class LoginManager extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIdReceived = '';
  bool isvisible = false;

  Future<bool> loginWithPhone(String no, context) async {
    await auth
        .verifyPhoneNumber(
            phoneNumber: no,
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
              isvisible = !isvisible;
            },
            codeAutoRetrievalTimeout: (String verificationId) {})
        .then((value) => true);
    return true;
  }

  void verifyOtp(String otp, context) async {
    print('verid :$verificationIdReceived');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdReceived, smsCode: otp);
    await FirebaseAuth.instance.signInWithCredential(credential).then(
          (_) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Navigation(),
            ),
          ),
        );
  }

  void signUp() {
    // Register Data Store
    FirebaseFirestore.instance.collection('user').add({
      'uid': 'credential userid',
      'name': 'nametextfield',
      'number': 'numbertextfield',
      'gender': 'gendertextfield',
      'dob': 'dobtextfield',
      'bloodgroup': 'bloodtextfield',
    });
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
