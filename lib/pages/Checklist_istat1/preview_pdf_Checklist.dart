import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:service_record/pages/Checklist_istat1/Page5.dart';
import 'package:service_record/pages/Checklist_istat1/export_pdf_Checklist.dart';
import 'package:service_record/pages/service_report/service_reportpage1.dart';




class PdfPreviewChecklist extends StatelessWidget {
  final ChecklistPDF checklistmodel;

  const PdfPreviewChecklist({
    super.key,
    required this.checklistmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF Preview'),
          actions: [
             GestureDetector(
              child: IconButton(
            onPressed: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => service_reportpage1()
                            ));
              },
            icon: Icon(Icons.note_add),
            iconSize: 30,
         
          )),
          ],
        ),
        body: PdfPreview(
          build: (context) {
          print(checklistmodel.no1);
          print(checklistmodel.no2_Clew);
            return makePdfChecklist(checklistmodel);
          },
        )
        );
  }
}

class PdfviewChecklist extends StatelessWidget {
  final ChecklistPDF checklistmodel;

  const PdfviewChecklist({
    super.key,
    required this.checklistmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PDF Preview'),
          actions: [
             GestureDetector(
              child: IconButton(
            onPressed: () {
             Navigator.popUntil(context, ModalRoute.withName('/homepage'));
              },
            icon: Icon(Icons.home),
              
          )),
          ],
        ),
        body: PdfPreview(
          build: (context) {
          print(checklistmodel.no1);
          print(checklistmodel.no2_Clew);
            return makePdfChecklist(checklistmodel);
          },
        )
        );
  }
}

