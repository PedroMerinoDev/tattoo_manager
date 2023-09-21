import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(25, 118, 210, .1),
  100: const Color.fromRGBO(25, 118, 210, .2),
  200: const Color.fromRGBO(25, 118, 210, .3),
  300: const Color.fromRGBO(25, 118, 210, .4),
  400: const Color.fromRGBO(25, 118, 210, .5),
  500: const Color.fromRGBO(25, 118, 210, .6),
  600: const Color.fromRGBO(25, 118, 210, .7),
  700: const Color.fromRGBO(25, 118, 210, .8),
  800: const Color.fromRGBO(25, 118, 210, .9),
  900: const Color.fromRGBO(25, 118, 210, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.orange.shade700;

  static MaterialColor customSwatchColor =
      MaterialColor(0xFF63a4ff, _swatchOpacity);
}
