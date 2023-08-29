import 'package:flutter/material.dart';

import '../pages/login/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.indigo;
    final primaryColorLight = Colors.lightBlue;
    final primaryColorDark = Colors.indigo.shade800;
    final colorAccent = Colors.orange;

    return MaterialApp(
      title: 'Tattoo Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorLight: primaryColorLight,
        primaryColorDark: primaryColorDark,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
            .copyWith(secondary: primaryColorLight)
            .copyWith(background: Colors.white),
        textTheme: TextTheme(
          /*  displayLarge: TextStyle(fontSize: 30, color: primaryColorDark),
          displayMedium: TextStyle(fontSize: 22, color: primaryColorDark),
          displaySmall: TextStyle(fontSize: 16, color: primaryColorDark),*/
          headlineLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: primaryColorDark),
          headlineMedium: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor),
          headlineSmall: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColorLight),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
          alignLabelWithHint: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColorDark),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(color: primaryColorDark),
            )),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
