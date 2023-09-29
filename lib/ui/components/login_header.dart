import 'package:flutter/material.dart';

import '../ui.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorDark
          ],
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 4,
            color: Colors.black,
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(80),
        ),
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          //******************** ICONE DO APP **********************\\
          Container(
            margin: const EdgeInsets.only(top: 32),
            child: Image(
              height: 75,
              width: 75,
              image: AssetImage(R.assets.appIcon),
            ),
          ),
          //******************** Text: Tattoo Manager **********************\\
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: AppName(
              titleColor: Colors.white,
              textSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
