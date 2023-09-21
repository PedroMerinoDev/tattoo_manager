import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui.dart';

class AppName extends StatelessWidget {
  final Color? titleColor;
  final double textSize;

  const AppName({
    Key? key,
    this.titleColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.courierPrime(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: R.string.tattoo,
            style: GoogleFonts.courierPrime(
              color: titleColor ?? CustomColors.customSwatchColor,
            ),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: R.string.manager,
            style: GoogleFonts.courierPrime(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
