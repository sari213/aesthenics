import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromRGBO(49,98,175, 1.0);
  static const Color black = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color bg = Color.fromRGBO(236,236,236, 1.0);
  static const Color bg1 = Color.fromRGBO(242,243,247, 1.0);
  static const Color bg2 = Color.fromRGBO(222,224,225, 1.0);
  static const Color tab = Color.fromRGBO(239,238,244, 1.0);
  static const Color blue_bg = Color.fromRGBO(168,196,241, 1.0);
  static const Color green = Color.fromRGBO(148,207,137, 1.0);
  static const Color gray = Color.fromRGBO(		125, 125, 125, 1.0);

  static const Map<int, Color> customColor = {
    50: Color.fromRGBO(49,98,175, .1),
    100: Color.fromRGBO(49,98,175, .2),
    200: Color.fromRGBO(49,98,175, .3),
    300: Color.fromRGBO(49,98,175, .4),
    400: Color.fromRGBO(49,98,175, .5),
    500: Color.fromRGBO(49,98,175, .6),
    600: Color.fromRGBO(49,98,175, .7),
    700: Color.fromRGBO(49,98,175, .8),
    800: Color.fromRGBO(49,98,175, .9),
    900: Color.fromRGBO(49,98,175, 1),
  };

  static const MaterialColor appColor = MaterialColor(0xFF3162af, customColor);
}
