import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            Theme.of(context).primaryColor,
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
            margin: const EdgeInsets.only(top: 48),
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
          const SizedBox(
            height: 125,
          ),

          //******************** Text: Gestão simples **********************\\
          Container(
            margin: const EdgeInsets.only(left: 16),
            alignment: AlignmentDirectional.bottomStart,
            child: SizedBox(
              width: 200,
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 25),
                child: Text(
                  R.string.gestaoSimplesDeEstudiosDeTatuagem,
                  style: GoogleFonts.comfortaa(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
