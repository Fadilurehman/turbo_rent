import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

TextStyle homeHead(size) {
  return GoogleFonts.truculenta(
      wordSpacing: 2,
      color: grayText,
      fontWeight: FontWeight.w700,
      letterSpacing: 2,
      fontSize: size.width * 0.06,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dotted,
      decorationThickness: 3,
      decorationColor: kBlack);
}

final headline = GoogleFonts.truculenta(
  fontSize: 35,
  letterSpacing: 3,
  color: kBlack,
  fontWeight: FontWeight.bold,
);

const headline1 = TextStyle(
  fontSize: 24,
  color: kwhite,
  fontWeight: FontWeight.bold,
);

const headline2 = TextStyle(
  fontSize: 14,
  color: kwhite,
  fontWeight: FontWeight.w600,
);
const headline3 = TextStyle(
  fontSize: 14,
  color: grayText,
  fontWeight: FontWeight.bold,
);
final headline4 = GoogleFonts.truculenta(
  color: grayText,
  fontWeight: FontWeight.w700,
  letterSpacing: 2,
  fontSize: 20,
);
final headline5 = GoogleFonts.truculenta(
  color: kwhite,
  fontWeight: FontWeight.w700,
  letterSpacing: 2,
  fontSize: 20,
);

final headline6 = GoogleFonts.truculenta(
  color: kBlack,
  fontWeight: FontWeight.w700,
  letterSpacing: 2,
  fontSize: 20,
);
const hintStyle = TextStyle(
  fontSize: 16,
  color: grayText,
  fontWeight: FontWeight.bold,
);

final splashHead = GoogleFonts.truculenta(
  color: kwhite,
  fontWeight: FontWeight.w700,
  letterSpacing: 16,
  fontSize: 30,
);

final titleCardName = GoogleFonts.montserrat(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

textstyle(
  double size,
  FontWeight fweight,
  Color clr,
) {
  return GoogleFonts.montserrat(
    letterSpacing: 0.5,
    fontSize: size,
    fontWeight: fweight,
    color: clr,
  );
}
