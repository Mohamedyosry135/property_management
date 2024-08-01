import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static final light = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(ColorCode.orange)) //change the color of appBar
      //brightness: Brightness.light //compare the BG color with text color
      );
}
