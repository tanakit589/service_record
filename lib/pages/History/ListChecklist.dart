import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/CheckList_Istat1_controller.dart';
import 'package:service_record/Model/Checklist_Istat1_model.dart';

import 'package:service_record/Model/service_report_model.dart';
import 'package:service_record/Service/CheckList_Istat1_service.dart';
import 'package:service_record/pages/Checklist_istat1/Page5.dart';
import 'package:service_record/pages/Checklist_istat1/preview_pdf_Checklist.dart';
import 'package:service_record/pages/HomePage.dart';

import 'package:service_record/pages/ListJob.dart';
import 'package:service_record/pages/service_report/preview_pdf_ServiceRrport.dart';

import 'package:service_record/widgets/drawer.dart';

class ListChecklist extends StatefulWidget {
  @override
  State<ListChecklist> createState() => _ListChecklistState();
}

class _ListChecklistState extends State<ListChecklist> {

  Checklist_Istat1Controller controller =
      Checklist_Istat1Controller(Checklist_Istat1Service());
  List<Checklist_Istat1> checklist_istat1s = List.empty();

  String _jobid = '';

  bool isLoading = false;
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    print(context.read<CustomerDeviceData>().jobid);
    _jobid = context.read<CustomerDeviceData>().jobid;
    _getChecklist(_jobid);
  }

  void _getChecklist(String jobid) async {
    var newjob_data = await controller.fetchChecklist(jobid);
    setState(() {
      checklist_istat1s = newjob_data;
           checklist_istat1s.sort((a, b) => b.date.compareTo(a.date));    

    });
  }

  Widget get listchecklist => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
          thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount: !checklist_istat1s.isEmpty ? checklist_istat1s.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!checklist_istat1s.isEmpty) {
                return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfviewChecklist(
                                checklistmodel: ChecklistPDF(
                              no1: checklist_istat1s[index].no1,
                              no2_Jams: checklist_istat1s[index].no2_Jams,
                              no2_Clew: checklist_istat1s[index].no2_Clew,
                              no3_a: checklist_istat1s[index].no3_a,
                              no3_b: checklist_istat1s[index].no3_b,
                              no4_a: checklist_istat1s[index].no4_a,
                              no4_b: checklist_istat1s[index].no4_b,
                              no4_c: checklist_istat1s[index].no4_c,
                              no4_d: checklist_istat1s[index].no4_d,
                              no4_e: checklist_istat1s[index].no4_e,
                              no4_f: checklist_istat1s[index].no4_f,
                              no5_a: checklist_istat1s[index].no5_a,
                              no5_b: checklist_istat1s[index].no5_b,
                              no5_c: checklist_istat1s[index].no5_c,
                              no6: checklist_istat1s[index].no6,
                              no7: checklist_istat1s[index].no7,
                              no8: checklist_istat1s[index].no8,
                              jamsVer: checklist_istat1s[index].jamsVer,
                              clewVer: checklist_istat1s[index].clewVer,
                              remarks: checklist_istat1s[index].remarks,
                              cussignUrl: checklist_istat1s[index].cussign,
                              servicename: context.read<UserDataModel>().name,
                              date: checklist_istat1s[index].date,
                              customer_name: checklist_istat1s[index].hospital,
                              department: checklist_istat1s[index].department,
                              sn: checklist_istat1s[index].sn,
                              temp: checklist_istat1s[index].temp,
                            )),
                          ));
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text('Date : ${checklist_istat1s[index].date}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfviewChecklist(
                                checklistmodel: ChecklistPDF(
                              no1: checklist_istat1s[index].no1,
                              no2_Jams: checklist_istat1s[index].no2_Jams,
                              no2_Clew: checklist_istat1s[index].no2_Clew,
                              no3_a: checklist_istat1s[index].no3_a,
                              no3_b: checklist_istat1s[index].no3_b,
                              no4_a: checklist_istat1s[index].no4_a,
                              no4_b: checklist_istat1s[index].no4_b,
                              no4_c: checklist_istat1s[index].no4_c,
                              no4_d: checklist_istat1s[index].no4_d,
                              no4_e: checklist_istat1s[index].no4_e,
                              no4_f: checklist_istat1s[index].no4_f,
                              no5_a: checklist_istat1s[index].no5_a,
                              no5_b: checklist_istat1s[index].no5_b,
                              no5_c: checklist_istat1s[index].no5_c,
                              no6: checklist_istat1s[index].no6,
                              no7: checklist_istat1s[index].no7,
                              no8: checklist_istat1s[index].no8,
                              jamsVer: checklist_istat1s[index].jamsVer,
                              clewVer: checklist_istat1s[index].clewVer,
                              remarks: checklist_istat1s[index].remarks,
                              cussignUrl: checklist_istat1s[index].cussign,
                              servicename: context.read<UserDataModel>().name,
                              date: checklist_istat1s[index].date,
                              customer_name: checklist_istat1s[index].hospital,
                              department: checklist_istat1s[index].department,
                              sn: checklist_istat1s[index].sn,
                              temp: checklist_istat1s[index].temp,
                            )),
                            ));
                      },
                      icon: Icon(Icons.description),
                    ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'No checklist now',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                );
              }
            }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Found ${checklist_istat1s.length} checklist'),
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
                          boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 62, 62, 62),
                                    blurRadius: 5,
                                    blurStyle: BlurStyle.outer)
                              ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1)),
          child: listchecklist),
      ),
    );
  }
}
