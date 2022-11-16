import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle headLine1 = GoogleFonts.oswald(
  letterSpacing: 6,
  fontWeight: FontWeight.w700,
  fontSize: 30,
);

TextStyle headLine2({
  Color? color,
}) =>
    GoogleFonts.oswald(
      letterSpacing: 1,
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: color ?? Colors.black87.withOpacity(.7),
    );

TextStyle titleStyle({
  Color? color,
}) =>
    GoogleFonts.oswald(
      letterSpacing: 0,
      fontWeight: FontWeight.w300,
      fontSize: 24,
      color: color ?? Colors.black87,
    );

TextStyle subtitleStyle({
  Color? color,
}) =>
    GoogleFonts.oswald(
      letterSpacing: 0,
      fontWeight: FontWeight.w300,
      fontSize: 19,
      color: color ?? Colors.black87,
    );
