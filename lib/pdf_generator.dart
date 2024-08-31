// lib/pdf_generator.dart
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<String> generatePdf(String name) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(
            'Hello, my name is $name',
            style: pw.TextStyle(fontSize: 24),
          ),
        );
      },
    ),
  );

  final outputFile = await _localFile;
  await outputFile.writeAsBytes(await pdf.save());

  return outputFile.path;
}

Future<File> get _localFile async {
  final directory = await getApplicationDocumentsDirectory();
  return File('${directory.path}/example.pdf');
}
