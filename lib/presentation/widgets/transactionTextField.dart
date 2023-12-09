import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextField transactionTextField({
  required String label,
  required TextEditingController value,
}) {
  return TextField(
    controller: value,
    enabled: false,
    style: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    decoration: InputDecoration(
      label: Text(
        label,
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(139, 139, 139, 1),
        ),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)),
      ),
    ),
  );
}
