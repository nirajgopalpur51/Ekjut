// App Icons.

import 'package:flutter/material.dart';

String userIcon = "assets/icons/user_icon.svg";
String keyIcon = "assets/icons/key_icon.svg";

// App Colors.

const Color g1 = Color(0xffE5B2CA);
const Color g2 = Color(0xffCD82DE);
const Color kInputColor = Color(0xff3C3C43);
const Color kButtonColor = Color(0xff78258B);
const Color kWhiteColor = Colors.white;

// Images.

String image1 = "assets/images/login.png";

class Config {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}