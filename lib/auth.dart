import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_backend/signin.dart';
import 'home.dart';
import 'navigation.dart';

import 'package:flutter/material.dart';
import 'ForgetPassword.dart';

class authentication extends StatefulWidget {
  const authentication({Key? key}) : super(key: key);

  @override
  _Day24AuthenticationState createState() => _Day24AuthenticationState();
}

class _Day24AuthenticationState extends State<authentication> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email/Pass Auth'),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                      controller: _usernameController,
                      key: ValueKey('username'),
                      decoration: InputDecoration(hintText: "Enter Username"),
                      validator: (value) {
                        if (value.toString().length < 3) {
                          return 'Username is so small';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value!;
                        });
                      },
                    )
                  : Container(),
              TextFormField(
                controller: _emailController,
                key: ValueKey('email'),
                decoration: InputDecoration(hintText: "Enter Email"),
                validator: (value) {
                  if (!(value.toString().contains('@'))) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                key: ValueKey('password'),
                decoration: InputDecoration(hintText: "Enter Password"),
                validator: (value) {
                  if (value.toString().length < 6) {
                    return 'Password is so small';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          isLogin
                              ? signin(email, password,context)
                              : signup(email, password,context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Navigation(),
                              ));
                        }
                      },
                      child: isLogin ? Text('Login') : Text('SignupNow'))),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? Text("Don't have an account? Signup")
                      : Text('Already Signed Up? Login')),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ));
                  },
                  child: Text("Forgot Password ?"))
            ],
          ),
        ),
      ),
    );
  }
}

// class auth extends StatelessWidget {
//   const auth({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     String useremail = "";
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 50,
//           width: 200,
//           child: ElevatedButton(
//               onPressed: () async {
//                 // await signInWithGoogle();

//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => Navigation()));
//               },
//               child: Text("Login with google")),
//         ),
//       ),
//     );
//   }

//   // signInWithGoogle() async {
//   //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   //   GoogleSignInAuthentication? googleauth = await googleUser?.authentication;

//   //   AuthCredential credential = GoogleAuthProvider.credential(
//   //     accessToken: googleauth?.accessToken,
//   //     idToken: googleauth?.idToken,
//   //   );
//   //   UserCredential? userCredential =
//   //       await FirebaseAuth.instance.signInWithCredential(credential);
//   //   print(userCredential.user?.displayName);
//   // }

//   Future<UserCredential> signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }import 'package:cloud_firestore/cloud_firestore.dart';
