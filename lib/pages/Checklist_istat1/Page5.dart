import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:hand_signature/signature.dart';
import 'package:service_record/Controller/CheckList_Istat1_controller.dart';
import 'package:service_record/Service/CheckList_Istat1_service.dart';
import 'package:service_record/pages/Checklist_istat1/Checklist_Istat1_ConsumerModel.dart';
import 'package:service_record/pages/Checklist_istat1/preview_pdf_Checklist.dart';
import 'package:service_record/pages/HomePage.dart';

import 'package:service_record/pages/ListJob.dart';
import 'package:service_record/pages/service_report/service_reportpage1.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:provider/provider.dart';

ValueNotifier<String?> CusSign_Check = ValueNotifier<String?>(null);
DateTime time = DateTime.now();
final control = HandSignatureControl(
  threshold: 3.0,
  smoothRatio: 0.5,
  velocityRange: 2.0,
);

class Checklist_istat_Page5 extends StatefulWidget {
  @override
  State<Checklist_istat_Page5> createState() => _Checklist_istat_Page5State();
}

class _Checklist_istat_Page5State extends State<Checklist_istat_Page5> {
  Checklist_Istat1Controller controller_addchecklist_istat1 =
      Checklist_Istat1Controller(Checklist_Istat1Service());

  void _add_checklist_istat1(
    String sn,
    String hospital,
    String department,
    bool no1,
    bool no2_Jams,
    bool no2_Clew,
    bool no3_a,
    bool no3_b,
    bool no4_a,
    bool no4_b,
    bool no4_c,
    bool no4_d,
    bool no4_e,
    bool no4_f,
    bool no5_a,
    bool no5_b,
    bool no5_c,
    bool no6,
    bool no7,
    bool no8,
    String jamsVer,
    String clewVer,
    String remarks,
    String jobId,
    String cussign,
    String servicename,
    String temp,
    String date,
  ) async {
    controller_addchecklist_istat1.add_checklist_istat1(
      sn,
      hospital,
      department,
      no1,
      no2_Jams,
      no2_Clew,
      no3_a,
      no3_b,
      no4_a,
      no4_b,
      no4_c,
      no4_d,
      no4_e,
      no4_f,
      no5_a,
      no5_b,
      no5_c,
      no6,
      no7,
      no8,
      jamsVer,
      clewVer,
      remarks,
      jobId,
      cussign,
      servicename,
      temp,
      date,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),
        appBar: AppBar(
          title: Text('Page5'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.center,
                    child:  Text(
                      'Have customers sign',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5
                    )
                  ),
                  height: 550,
                  width: 450,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 470,
                          width: 450,
                          // constraints: BoxConstraints.expand(),
                          color: Colors.grey,
                          child: HandSignature(
                            control: control,
                            color: Colors.black,
                            width: 2,
                            maxWidth: 10,
                            type: SignatureDrawType.line,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(
                                    255, 198, 198, 198), // Background color
                              ),
                              onPressed: () {
                                control.clear();
        
                                CusSign_Check.value = null;
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text('Cleared')));
                              },
                              child: Text(
                                'clear',
                                style: TextStyle(fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                                onPressed: () async {
                                  CusSign_Check.value = control.toSvg(
                                      color: Colors.cyan,
                                      size: Size(512, 256),
                                      strokeWidth: 3.0,
                                      maxStrokeWidth: 15.0,
                                      type: SignatureDrawType.line);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text('saved')));
                                  print(CusSign_Check.value);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green, // Background color
                                ),
                                child: Text(
                                  'save',
                                  style: TextStyle(fontSize: 18),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
           
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('back')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                            control.clear();
                          _add_checklist_istat1(
                            context.read<CustomerDeviceData>().sn,
                            context.read<CustomerDeviceData>().hospital,
                            context.read<CustomerDeviceData>().department,
                            context.read<Checklist_Istat1_ConsumerModel>().no1,
                            context
                                .read<Checklist_Istat1_ConsumerModel>()
                                .no2_Jams,
                            context
                                .read<Checklist_Istat1_ConsumerModel>()
                                .no2_Clew,
                            context.read<Checklist_Istat1_ConsumerModel>().no3_a,
                            context.read<Checklist_Istat1_ConsumerModel>().no3_b,
                            context.read<Checklist_Istat1_ConsumerModel>().no4_a,
                            context.read<Checklist_Istat1_ConsumerModel>().no4_b,
                            context.read<Checklist_Istat1_ConsumerModel>().no4_c,
                            context.read<Checklist_Istat1_ConsumerModel>().no4_d,
                            context.read<Checklist_Istat1_ConsumerModel>().no4_e,
                            context.read<Checklist_Istat1_ConsumerModel>().no4_f,
                            context.read<Checklist_Istat1_ConsumerModel>().no5_a,
                            context.read<Checklist_Istat1_ConsumerModel>().no5_b,
                            context.read<Checklist_Istat1_ConsumerModel>().no5_c,
                            context.read<Checklist_Istat1_ConsumerModel>().no6,
                            context.read<Checklist_Istat1_ConsumerModel>().no7,
                            context.read<Checklist_Istat1_ConsumerModel>().no8,
                            context.read<Checklist_Istat1_ConsumerModel>().jamsVer,
                            context.read<Checklist_Istat1_ConsumerModel>().clewVer,
                            context.read<Checklist_Istat1_ConsumerModel>().remarks,
                            context.read<CustomerDeviceData>().jobid,
                            CusSign_Check.value.toString(),
                            context.read<UserDataModel>().name,
                           
                            context.read<Checklist_Istat1_ConsumerModel>().temp,
                             '${time.day}/${time.month}/${time.year}',
                          );
        
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PdfPreviewChecklist(
                                    checklistmodel: ChecklistPDF(
                                  no1: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no1,
                                  no2_Jams: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no2_Jams,
                                  no2_Clew: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no2_Clew,
                                  no3_a: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no3_a,
                                  no3_b: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no3_b,
                                  no4_a: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no4_a,
                                  no4_b: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no4_b,
                                  no4_c: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no4_c,
                                  no4_d: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no4_d,
                                  no4_e: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no4_e,
                                  no4_f: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no4_f,
                                  no5_a: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no5_a,
                                  no5_b: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no5_b,
                                  no5_c: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no5_c,
                                  no6: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no6,
                                  no7: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no7,
                                  no8: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .no8,
                                  jamsVer: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .jamsVer,
                                  clewVer: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .clewVer,
                                  remarks: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .remarks,
                                  cussignUrl: CusSign_Check.value.toString(),
                                  servicename: context.read<UserDataModel>().name,
                                  date: '${time.day}/${time.month}/${time.year}',
                                  customer_name:
                                      context.read<CustomerDeviceData>().hospital,
                                  department: context
                                      .read<CustomerDeviceData>()
                                      .department,
                                  sn: context.read<CustomerDeviceData>().sn,
                                  temp: context
                                      .read<Checklist_Istat1_ConsumerModel>()
                                      .temp,
                                )),
                              ));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 1),
                              
                                content: Text(
                              'Saved',
                              style: TextStyle(fontSize: 16),
                            )));
                        },
                        child: Center(
                            child: Text(
                                'Submit'))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class Signmodel extends ChangeNotifier {
  ValueNotifier<String?> CusSign_Check = ValueNotifier<String?>(null);
  ValueNotifier<String?> get getCusSign_Check => this.CusSign_Check;

  set setCusSign_Check(ValueNotifier<String?> CusSign_Check) {
    this.CusSign_Check = CusSign_Check;
    notifyListeners();
  }
}



class ChecklistPDF {
  final bool no1;
  final bool no2_Jams;
  final bool no2_Clew;
  final bool no3_a;
  final bool no3_b;
  final bool no4_a;
  final bool no4_b;
  final bool no4_c;
  final bool no4_d;
  final bool no4_e;
  final bool no4_f;
  final bool no5_a;
  final bool no5_b;
  final bool no5_c;
  final bool no6;
  final bool no7;
  final bool no8;
  final String jamsVer;
  final String clewVer;
  final String remarks;
  final String cussignUrl;
  final String servicename;
  final String date;
  final String customer_name;
  final String department;
  final String sn;
  final String temp;

  ChecklistPDF(
      {required this.no1,
      required this.no2_Jams,
      required this.no2_Clew,
      required this.no3_a,
      required this.no3_b,
      required this.no4_a,
      required this.no4_b,
      required this.no4_c,
      required this.no4_d,
      required this.no4_e,
      required this.no4_f,
      required this.no5_a,
      required this.no5_b,
      required this.no5_c,
      required this.no6,
      required this.no7,
      required this.no8,
      required this.jamsVer,
      required this.clewVer,
      required this.remarks,
      required this.cussignUrl,
      required this.servicename,
      required this.date,
      required this.customer_name,
      required this.department,
      required this.sn,
      required this.temp});
}
