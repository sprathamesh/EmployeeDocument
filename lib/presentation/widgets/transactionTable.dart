import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment4/data/models/transactionDocument.dart';
import 'package:assignment4/presentation/widgets/bodyTable.dart';
import 'package:assignment4/presentation/widgets/headTable.dart';
import 'package:assignment4/presentation/widgets/pdfView.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

SizedBox transactionTable(
    {required BuildContext context,
    required List<TransactionDocument> documents}) {
  return SizedBox(
    width: double.infinity,
    child: Table(
      border: TableBorder.all(
        color: Color.fromRGBO(48, 48, 48, 0.05),
        width: 1,
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(48, 48, 48, 0.05),
          ),
          children: [
            headTable(text: "Document Table"),
            headTable(text: "Checklist Name"),
            headTable(text: "Date & Time"),
            headTable(text: "Status"),
            headTable(text: "Action"),
          ],
        ),
        ...documents.map(   //spreac opertor to spread result of map 
          (e) => TableRow(    //e each element
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: bodyTable(text: e.title),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: bodyTable(text: e.checkListName),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: bodyTable(text: e.date),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TableCell(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: e.status == "Unapproved"
                          ? Colors.red
                          : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        e.status,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: e.status == "Unapproved"
                              ? Colors.black
                              : Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TableCell(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerScreen(url: e.url),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Color.fromRGBO(35, 97, 219, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}