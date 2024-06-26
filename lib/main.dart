import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_backend/Controller/Bindings.dart';
import 'package:login_backend/Screens/EmeAmbulance.dart';
import 'package:login_backend/Screens/doctor_schedule.dart';
import 'package:login_backend/Screens/doctors_list.dart';
import 'package:login_backend/Screens/home_screen.dart';
import 'package:login_backend/Screens/register_screen.dart';
import 'package:login_backend/navigation.dart';
import 'package:login_backend/provider/login_manager.dart';
import 'package:provider/provider.dart';
import 'Screens/LogIn.dart';
import 'Screens/card.dart';
import 'auth.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginManager(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialBinding: LocationBinding(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomeScreen(),
        // home: Navigation(),
        home:FirebaseAuth.instance.currentUser != null?Navigation():LoginPage(),
        // home: LocationPage(),
      ),
    );
  }
}
