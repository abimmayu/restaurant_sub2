import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.roboto(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.roboto(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.roboto(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.roboto(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.roboto(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.roboto(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.roboto(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.roboto(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.inter(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.inter(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

const colorPrimary = Color(0xff944E6C);
const colorGrey = Color(0xffBDBDBD);
const colorWhiteGrey = Color(0xffF6F6F6);
const buttonFavorite = Colors.red;
const iconRatings = Colors.yellow;
const bgColorWhite = Color(0xffFAFAFA);
const textStyleTitle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
final textWithOpacity = TextStyle(
  color: Colors.black.withOpacity(0.4),
  fontSize: 12,
);
const textStyleSubTitle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w400,
);
