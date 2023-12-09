import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// transaction table
TableCell headTable({required String text}) {
  return TableCell(
    child: Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  text,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                if (text != "Action")
                  Image.asset(
                    'assets/table_arrow.png',
                    color: Colors.grey,
                    width: 25,
                    height: 25,
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
