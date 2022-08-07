import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

primaryFont(
    {double fsize = 16,
    fweight = FontWeight.normal,
    fcolor = const Color(0Xff192a56),
    double hght = 3
    }) {
  return GoogleFonts.dmSans(
      fontSize: fsize,
      fontWeight: fweight,
      height: hght,
      letterSpacing: 3,
      color: fcolor);
}
