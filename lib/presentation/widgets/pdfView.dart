import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:assignment4/presentation/pages/layoutHome.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String url;

  const PdfViewerScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // open the PDF in a new tab for web
      launchUrl(Uri.parse(url));
      return const LayoutHome(); 
    } else {
      // Running on a mobile 
      return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Viewer'),
        ),
        body: SfPdfViewer.network(
          url,
          canShowScrollHead: false,
        ),
      );
    }
  }
}