import 'package:flutter/material.dart';
import 'package:assignment4/presentation/widgets/pdfView.dart';
import 'package:assignment4/presentation/widgets/subtitleText.dart';
import 'package:assignment4/presentation/widgets/titleText.dart';
import '../../data/models/joining.dart';

Builder buildTabs({required List<Joining> documents}) {
  return Builder(
    builder: (context) => SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          shape: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(48, 48, 48, 0.05), width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(05),
              color: Color(0xFFF2F2F2),
            ),
            child: Image.asset("assets/pdf.png"),
          ),
          title: titleText(documents[index].title),
          subtitle: subtitleText(documents[index].size),
          trailing: IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PdfViewerScreen(url: documents[index].url),
                  ),
                );
              },
              icon: const Icon(
                Icons.remove_red_eye,
                color: Color.fromRGBO(35, 97, 219, 1),
              )),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: documents.length,
      ),
    ),
  );
}