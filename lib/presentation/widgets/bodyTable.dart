import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// transaction body
TableCell bodyTable({required String text}) {
  return TableCell(
    child: Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(94, 94, 94, 1),
          ),
        ),
      ),
    ),
  );
}
