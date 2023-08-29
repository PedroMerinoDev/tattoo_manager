import 'package:flutter/material.dart';

import '../pages/login/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tattoo Manager',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
