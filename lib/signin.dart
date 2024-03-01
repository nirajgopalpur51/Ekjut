import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'navigation.dart';

signup(String email, String password,BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print('/////// Success ////////');
    addUserDetails(email, password);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Navigation(),
        ));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future addUserDetails(String email, String password) async {
  await FirebaseFirestore.instance.collection("users").add({
    "email": email,
    "password": password,
  });
}

signin(String email, password,BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Navigation(),
        ));
    print('/////// Success ////////');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      SnackBar(content: Text(" user-not-found"));
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      SnackBar(content: Text(" Wrong password provided for that user."));
      print('Wrong password provided for that user.');
    }
  }
}
