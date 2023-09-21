import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color.fromRGBO(25, 118, 210, 1);
  const primaryColorDark = Color.fromRGBO(0, 75, 160, 1);
  const primaryColorLight = Color.fromRGBO(99, 164, 225, 1);
  const secondaryColor = Color.fromRGBO(255, 160, 0, 1);
  const secondaryColorDark = Color.fromRGBO(198, 113, 0, 1);
  final disabledColor = Colors.grey[400];
  const dividerColor = Colors.grey;
  const textTheme = TextTheme(
      displayLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: primaryColorDark));
  const inputDecorationTheme = InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColorLight)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      alignLabelWithHint: true);
  final buttonTheme = ButtonThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColor),
      buttonColor: primaryColor,
      splashColor: primaryColorLight,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      highlightColor: secondaryColor,
      secondaryHeaderColor: secondaryColorDark,
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      buttonTheme: buttonTheme,
      colorScheme: const ColorScheme.light(primary: primaryColor)
          .copyWith(background: Colors.white));
}
