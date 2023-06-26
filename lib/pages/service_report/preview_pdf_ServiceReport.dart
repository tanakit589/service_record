import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'package:service_record/pages/service_report/service_reportpage4.dart';

import 'export_pdf_ServiceReport.dart';

class PdfPreviewPage extends StatefulWidget {
  final ServiceReportPDF servicemodel;

  const PdfPreviewPage({
    super.key,
    required this.servicemodel,
  });

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  


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
              setState(() {
                
              });},
            icon: Icon(Icons.home),
            iconSize: 30,
          )),
         
        

          ],
        ),
        body: PdfPreview(
          build: (context) {
            print( widget.servicemodel.Commissioning);
            print( widget.servicemodel.Installation);
            print( widget.servicemodel.Internal);
            print( widget.servicemodel. PM);
            print( widget.servicemodel.ServiceCall);
            print( widget.servicemodel.ServiceContract);
            print( widget.servicemodel.Warranty);
            print( widget.servicemodel.Workshop);
            print(widget.servicemodel.status);
            print( widget.servicemodel.cussignUrl);
            print( widget.servicemodel.contract);
            print( widget.servicemodel.contract_no);
            print( widget.servicemodel.customer_name);
            print( widget.servicemodel.date);
            print( widget.servicemodel.department);
            print( widget.servicemodel.fault);
            print( widget.servicemodel.manufacturer);
            print( widget.servicemodel.model);
            print( widget.servicemodel.partname1);
            print( widget.servicemodel.partname2);
            print( widget.servicemodel.partname3);
            print( widget.servicemodel.partname4);
            print( widget.servicemodel.partnumber1);
            print( widget.servicemodel.partnumber2);
            print( widget.servicemodel.partnumber3);
            print( widget.servicemodel.partnumber4);
            print( widget.servicemodel.remark); 
            print( widget.servicemodel.servicename);
            print( widget.servicemodel.sn);
            print( widget.servicemodel.time);
            print( widget.servicemodel.workdone);
            return makePdf(widget.servicemodel);
          },
        ));
  }
}
