import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xffEF6565);
  static Color secondary = const Color.fromRGBO(255, 180, 180, 1);
  // static Color primary = const Color(0xff28CD9A);
  // static Color secondary = const Color.fromARGB(255, 123, 223, 191);
  // static Color primary = Color(0xfff2f9fe);
  // static Color secondary = Color(0xFFdbe4f3);

  static Color lightGreen = const Color(0xff28CD9A);
  static Color textFieldColor = const Color.fromARGB(103, 154, 154, 154);

  static Color light = const Color(0xffEDFFF9);
  static Color green = const Color.fromARGB(255, 0, 163, 109);
  static Color black = const Color(0xff0F0F0F);
  static Color lightBlack = const Color(0xff1C1D1E);
  static Color dark = const Color(0xff4D5E59);
  static Color white = const Color.fromARGB(255, 255, 255, 255);
  static Color grey = const Color.fromARGB(255, 138, 145, 153);
  static Color darkGrey = const Color(0xff5D5D5D);
  static Color error = const Color(0xffEF6565);
  static Color blue = const Color(0xff3EB9FE);
  static Color darkBlue = const Color(0xff72B5EF);
  static Color babyBlue = const Color(0xffF1F2FF);
  static Color yellow = const Color(0xffFDD734);
  static Color lightYellow = const Color(0xffFFFDC3);
  static Color lightYellowBG = const Color(0xffFFFCEF);
  static Color lightYellowBG2 = const Color(0xffFFF3BE);
  static Color lightGrey = const Color(0xffF7FCFB);
  static Color lightGreyBG = const Color(0xffFCFCFC);
  static Color transparent = const Color.fromARGB(0, 255, 255, 255);
  static Color chatBTNTXT = const Color(0xff2B59C3);
  static Color homeBTNTXT = const Color.fromARGB(255, 55, 119, 67);
  static Color cardSession = const Color(0xff4FB0C6);
  static Color statusBar = const Color.fromARGB(255, 17, 186, 130);
  static int r = Random().nextInt(110) + 60;
  static int g = Random().nextInt(110) + 60;
  static int b = Random().nextInt(110) + 60;
}
