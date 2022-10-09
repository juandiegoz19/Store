import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xffe55f48, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffce5641), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor whiteToDark = MaterialColor(
    0xffffffff, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe6e6e6), //10%
      100: Color(0xffcccccc), //20%
      200: Color(0xffb3b3b3), //30%
      300: Color(0xff999999), //40%
      400: Color(0xff808080), //50%
      500: Color(0xff666666), //60%
      600: Color(0xff4c4c4c), //70%
      700: Color(0xff333333), //80%
      800: Color(0xff191919), //90%
      900: Color(0xff000000), //100%
    },
  );
}
