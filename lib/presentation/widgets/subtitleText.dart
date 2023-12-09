import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Text subtitleText(String text) => Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(128, 128, 128, 1),
      ),
    );