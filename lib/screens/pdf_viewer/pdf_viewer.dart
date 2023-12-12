import 'dart:io';

import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/extensions/string_ext.dart';
import 'package:calendar_app/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CustomPdfView extends StatelessWidget {
  static const routeName = 'pdf-view';

  static Widget builder(BuildContext context) {
    return const CustomPdfView();
  }

  const CustomPdfView({super.key});

  @override
  Widget build(BuildContext context) {
    String? pdfPath;
    CustomPdfViewArg customPdfViewArg = context.args as CustomPdfViewArg;
    pdfPath = customPdfViewArg.pdfPath;
    String title = customPdfViewArg.title;
    if (pdfPath.isNullOrEmpty) {
      context.navigator.pop();
    }
    bool isUrl = pdfPath.contains('firebase');
    return Scaffold(
        appBar: AppBar(title: Text(isUrl ? title : pdfPath.split('/').last)),
        body: Builder(
          builder: (context) {
            if (isUrl) {
              return SfPdfViewer.network(pdfPath ?? '');
            } else {
              return SfPdfViewer.file(File(pdfPath ?? ''));
            }
          },
        ));
  }
}
