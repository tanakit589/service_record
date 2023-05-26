import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:service_record/Controller/service_report_controller.dart';

import 'package:service_record/Model/service_report_model.dart';

import 'package:service_record/Service/service_report_service.dart';
import 'package:service_record/pages/History/history.dart';
import 'package:service_record/pages/ListJob.dart';
import 'package:service_record/pages/service_report/preview_pdf_ServiceRrport.dart';
import 'package:service_record/pages/service_report/service_reportpage1.dart';
import 'package:service_record/pages/service_report/service_reportpage2.dart';
import 'package:service_record/pages/service_report/service_reportpage4.dart';
import 'package:service_record/widgets/drawer.dart';

class ListReport extends StatefulWidget {
  @override
  State<ListReport> createState() => _ListJobSearchState();
}

class _ListJobSearchState extends State<ListReport> {
  ServiceReportController controller =
      ServiceReportController(ServiceReportService());
  List<ServiceReportModel> List_report = List.empty();

  String _jobid = '';

  bool isLoading = false;
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    print(context.read<CustomerDeviceData>().jobid);
    _jobid = context.read<CustomerDeviceData>().jobid;
    _get_service_report(_jobid);
  }

  void _get_service_report(String jobId) async {
    var newjob_data = await controller.fetch_service_report(jobId);
    setState(() {
      List_report = newjob_data;
       List_report.sort((a, b) => b.date.compareTo(a.date));  
    });
  }

  Widget get searchJob => isLoading
      ? CircularProgressIndicator()
      :Scrollbar(
          thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount: !List_report.isEmpty ? List_report.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!List_report.isEmpty) {
                return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfPreviewPage(
                                servicemodel: ServiceReportPDF(
                              customer_name: List_report[index].customer_name,
                              department:
                                  List_report[index].department,
                              model:List_report[index].model,
                              contract:
                                 List_report[index].contract,
                              contract_no:
                                 List_report[index].contract_no,
                              sn: List_report[index].sn,
                              manufacturer: List_report[index].manufacturer,
                              Installation: List_report[index].Installation,
                              Commissioning:List_report[index].Commissioning,
                              ServiceContract: List_report[index].ServiceContract,
                              Warranty:
                                 List_report[index].Warranty,
                              ServiceCall:List_report[index].ServiceCall,
                              PM:List_report[index].PM,
                              Workshop:
                                  List_report[index].Workshop,
                              Internal:
                                  List_report[index].Internal,
                              status: List_report[index].status,
                              fault: List_report[index].fault,
                              workdone: List_report[index].workdone,
                              remark: List_report[index].remark,
                              partnumber1:
                                  List_report[index].partnumber1,
                              partname1: List_report[index].partname1,
                              partnumber2:
                                  List_report[index].partnumber2,
                              partname2: List_report[index].partname2,
                              partnumber3:
                                  List_report[index].partnumber3,
                              partname3: List_report[index].partname3,
                              partnumber4:
                                  List_report[index].partnumber4,
                              partname4: List_report[index].partname4,
                              cussignUrl: List_report[index].cussignUrl,
                              date: List_report[index].date,
                              time: List_report[index].time,
                              servicename: List_report[index].servicename,
                            )),
                          ));
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fault : ${List_report[index].fault}'),
                        Text('Date : ${List_report[index].date}'),
                       
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfPreviewPage(
                                servicemodel: ServiceReportPDF(
                              customer_name: List_report[index].customer_name,
                              department:
                                  List_report[index].department,
                              model:List_report[index].model,
                              contract:
                                 List_report[index].contract,
                              contract_no:
                                 List_report[index].contract_no,
                              sn: List_report[index].sn,
                              manufacturer: List_report[index].manufacturer,
                              Installation: List_report[index].Installation,
                              Commissioning:List_report[index].Commissioning,
                              ServiceContract: List_report[index].ServiceContract,
                              Warranty:
                                 List_report[index].Warranty,
                              ServiceCall:List_report[index].ServiceCall,
                              PM:List_report[index].PM,
                              Workshop:
                                  List_report[index].Workshop,
                              Internal:
                                  List_report[index].Internal,
                              status: List_report[index].status,
                              fault: List_report[index].fault,
                              workdone: List_report[index].workdone,
                              remark: List_report[index].remark,
                              partnumber1:
                                  List_report[index].partnumber1,
                              partname1: List_report[index].partname1,
                              partnumber2:
                                  List_report[index].partnumber2,
                              partname2: List_report[index].partname2,
                              partnumber3:
                                  List_report[index].partnumber3,
                              partname3: List_report[index].partname3,
                              partnumber4:
                                  List_report[index].partnumber4,
                              partname4: List_report[index].partname4,
                              cussignUrl: List_report[index].cussignUrl,
                              date: List_report[index].date,
                              time: List_report[index].time,
                              servicename: List_report[index].servicename,
                            )),
                          ));},
                      icon: Icon(Icons.description),
                    ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('No report now',
                      style: TextStyle(fontSize: 20),),
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
        title: Text('Found ${List_report.length} reports'),
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
          child: searchJob),
      ),
    );
  }
}
