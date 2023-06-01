import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';
import 'package:service_record/Controller/service_report_controller.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/Service/service_report_service.dart';
import 'package:service_record/pages/HomePage.dart';
import 'package:service_record/pages/ListJob.dart';
import 'package:service_record/pages/service_report/preview_pdf_ServiceRrport.dart';
import 'package:service_record/pages/service_report/service_reportpage1.dart';
import 'package:service_record/pages/service_report/service_reportpage2.dart';
import 'package:service_record/pages/service_report/service_reportpage3.dart';
import 'package:service_record/pages/service_report/service_reportpage4.dart';

import 'dart:async';
import 'package:provider/provider.dart';

ValueNotifier<String?> CusSign = ValueNotifier<String?>(null);
ServiceReportController controller_addreport =
    ServiceReportController(ServiceReportService());
// ServiceReportController controller_report =
// ServiceReportController(ServiceReportService());

Job_Data_Controller controller_updateJobStatus =
    Job_Data_Controller(AddJob_DataService());

final control = HandSignatureControl(
  threshold: 3.0,
  smoothRatio: 0.5,
  velocityRange: 2.0,
);
String _customer_name = '';
String _department = '';
String _model = '';
String _contract = '';
String _contract_no = '';
String _sn = '';
String _manufacturer = '';
bool _Installation = false;
bool _Commissioning = false;
bool _ServiceContract = false;
bool _Warranty = false;
bool _ServiceCall = false;
bool _PM = false;
bool _Workshop = false;
bool _Internal = false;
List _status = [];
String _fault = '';
String _workdone = '';
String _remark = '';
List<String> _partnumberField = [];
List<String> _partnameField = [];
String _cussignUrl = '';
DateTime time = DateTime.now();
String _time = '';
String _servicename = '';

Future<String> _addservice_report(
    String customer_name,
    String department,
    String model,
    String contract,
    String contract_no,
    String sn,
    String manufacturer,
    bool Installation,
    bool Commissioning,
    bool ServiceContract,
    bool Warranty,
    bool ServiceCall,
    bool PM,
    bool Workshop,
    bool Internal,
    List status,
    String fault,
    String workdone,
    String remark,
    String partnumber1,
    String partname1,
    String partnumber2,
    String partname2,
    String partnumber3,
    String partname3,
    String partnumber4,
    String partname4,
    String cussignUrl,
    String date,
    String time,
    String servicename,
    String jobId) async {
  String reportId = await controller_addreport.add_service_report(
      customer_name,
      department,
      model,
      contract,
      contract_no,
      sn,
      manufacturer,
      Installation,
      Commissioning,
      ServiceContract,
      Warranty,
      ServiceCall,
      PM,
      Workshop,
      Internal,
      status,
      fault,
      workdone,
      remark,
      partnumber1,
      partname1,
      partnumber2,
      partname2,
      partnumber3,
      partname3,
      partnumber4,
      partname4,
      cussignUrl,
      date,
      time,
      servicename,
      jobId);
  return reportId;
}

void _updatereportId(String reportId) async {
  controller_addreport.updatereportId(reportId);
}

void _updateJobStatus(
    String jobId, List status, String servicereport_id) async {
  controller_updateJobStatus.updateJobStatus(jobId, status, servicereport_id);
}

class service_reportpage4 extends StatefulWidget {
  @override
  State<service_reportpage4> createState() => _service_reportpage4State();
}

class _service_reportpage4State extends State<service_reportpage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: drawer(),
        appBar: AppBar(
          title: Text('Page4'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
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
        
                                CusSign.value = null;
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
                                  CusSign.value = control.toSvg(
                                      color: Colors.cyan,
                                      size: Size(512, 256),
                                      strokeWidth: 3.0,
                                      maxStrokeWidth: 15.0,
                                      type: SignatureDrawType.line);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text('saved')));
                                  print(CusSign.value);
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
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('back')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          control.clear();
                          print(CusSign.value.toString());
                          if (CusSign.value.toString() != 'null') {
                            final String reportId = await _addservice_report(
                              _customer_name = context
                                  .read<CustomerProfileModel>()
                                  .Customer_name,
                              _department =
                                  context.read<CustomerProfileModel>().Department,
                              _model = context.read<CustomerProfileModel>().Model,
                              _contract =
                                  context.read<CustomerProfileModel>().Contact,
                              _contract_no =
                                  context.read<CustomerProfileModel>().Contact_No,
                              _sn = context
                                  .read<CustomerProfileModel>()
                                  .Serial_Number,
                              _manufacturer = context
                                  .read<CustomerProfileModel>()
                                  .Manufacturer,
                              _Installation = context
                                  .read<ListTypeServiceModel>()
                                  .Installation,
                              _Commissioning = context
                                  .read<ListTypeServiceModel>()
                                  .Commissioning,
                              _ServiceContract = context
                                  .read<ListTypeServiceModel>()
                                  .ServiceContract,
                              _Warranty =
                                  context.read<ListTypeServiceModel>().Warranty,
                              _ServiceCall = context
                                  .read<ListTypeServiceModel>()
                                  .ServiceCall,
                              _PM = context.read<ListTypeServiceModel>().PM,
                              _Workshop =
                                  context.read<ListTypeServiceModel>().Workshop,
                              _Internal =
                                  context.read<ListTypeServiceModel>().Internal,
                              _status = context
                                  .read<ListTypeServiceModel>()
                                  .checkListItems,
                              _fault = context.read<DetailRepotModel>().Fault,
                              _workdone =
                                  context.read<DetailRepotModel>().WorkDone,
                              _remark = context.read<DetailRepotModel>().Remark,
                              context.read<SparePartModel>().partnumber1,
                              context.read<SparePartModel>().partname1,
                              context.read<SparePartModel>().partnumber2,
                              context.read<SparePartModel>().partname2,
                              context.read<SparePartModel>().partnumber3,
                              context.read<SparePartModel>().partname3,
                              context.read<SparePartModel>().partnumber4,
                              context.read<SparePartModel>().partname4,
                              _cussignUrl = CusSign.value.toString(),
                              '${time.day}/${time.month}/${time.year}',
                              '${time.hour}:${time.minute}',
                              _servicename = context.read<UserDataModel>().name,
                              context.read<CustomerDeviceData>().jobid,
                            );
                            _updatereportId(reportId);
                            _updateJobStatus(
                              context.read<CustomerDeviceData>().jobid,
                              context.read<ListTypeServiceModel>().checkListItems,
                              reportId,
                            );
        
                            context.read<Timemodel>()
                              ..time = '${time.hour}:${time.minute}'
                              ..date = '${time.day}/${time.month}/${time.year}';
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 1),
                              
                                content: Text(
                              'Saved',
                              style: TextStyle(fontSize: 16),
                            )));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PdfPreviewPage(
                                      servicemodel: ServiceReportPDF(
                                    customer_name: context
                                        .read<CustomerProfileModel>()
                                        .Customer_name,
                                    department: context
                                        .read<CustomerProfileModel>()
                                        .Department,
                                    model: context
                                        .read<CustomerProfileModel>()
                                        .Model,
                                    contract: context
                                        .read<CustomerProfileModel>()
                                        .Contact,
                                    contract_no: context
                                        .read<CustomerProfileModel>()
                                        .Contact_No,
                                    sn: context
                                        .read<CustomerProfileModel>()
                                        .Serial_Number,
                                    manufacturer: context
                                        .read<CustomerProfileModel>()
                                        .Manufacturer,
                                    Installation: context
                                        .read<ListTypeServiceModel>()
                                        .Installation,
                                    Commissioning: context
                                        .read<ListTypeServiceModel>()
                                        .Commissioning,
                                    ServiceContract: context
                                        .read<ListTypeServiceModel>()
                                        .ServiceContract,
                                    Warranty: context
                                        .read<ListTypeServiceModel>()
                                        .Warranty,
                                    ServiceCall: context
                                        .read<ListTypeServiceModel>()
                                        .ServiceCall,
                                    PM: context.read<ListTypeServiceModel>().PM,
                                    Workshop: context
                                        .read<ListTypeServiceModel>()
                                        .Workshop,
                                    Internal: context
                                        .read<ListTypeServiceModel>()
                                        .Internal,
                                    status: context
                                        .read<ListTypeServiceModel>()
                                        .checkListItems,
                                    fault: context.read<DetailRepotModel>().Fault,
                                    workdone:
                                        context.read<DetailRepotModel>().WorkDone,
                                    remark:
                                        context.read<DetailRepotModel>().Remark,
                                    partnumber1: context
                                        .read<SparePartModel>()
                                        .partnumber1,
                                    partname1:
                                        context.read<SparePartModel>().partname1,
                                    partnumber2: context
                                        .read<SparePartModel>()
                                        .partnumber2,
                                    partname2:
                                        context.read<SparePartModel>().partname2,
                                    partnumber3: context
                                        .read<SparePartModel>()
                                        .partnumber3,
                                    partname3:
                                        context.read<SparePartModel>().partname3,
                                    partnumber4: context
                                        .read<SparePartModel>()
                                        .partnumber4,
                                    partname4:
                                        context.read<SparePartModel>().partname4,
                                    cussignUrl: CusSign.value.toString(),
                                    date:
                                        '${time.day}/${time.month}/${time.year}',
                                    time: '${time.hour}:${time.minute}',
                                    servicename:
                                        context.read<UserDataModel>().name,
                                  )),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              'Please sign a signature.',
                              style: TextStyle(fontSize: 16),
                            )));
                          }
                        },
                        child: Text('Submit')),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class Timemodel extends ChangeNotifier {
  String _time = '';
  String _date = '';

  get time => this._time;

  set time(time) {
    this._time = time;
    notifyListeners();
  }

  get date => this._date;

  set date(date) {
    this._date = date;
    notifyListeners();
  }
}

class Signmodel extends ChangeNotifier {
  ValueNotifier<String?> CusSign = ValueNotifier<String?>(null);
  ValueNotifier<String?> get getCusSign => this.CusSign;

  set setCusSign(ValueNotifier<String?> CusSign) {
    this.CusSign = CusSign;
    notifyListeners();
  }
}

class ServiceReportPDF {
  final String customer_name;
  final String department;
  final String model;
  final String contract;
  final String contract_no;
  final String sn;
  final String manufacturer;
  final bool Installation;
  final bool Commissioning;
  final bool ServiceContract;
  final bool Warranty;
  final bool ServiceCall;
  final bool PM;
  final bool Workshop;
  final bool Internal;
  final List status;
  final String fault;
  final String workdone;
  final String remark;
  final String partnumber1;
  final String partname1;
  final String partnumber2;
  final String partname2;
  final String partnumber3;
  final String partname3;
  final String partnumber4;
  final String partname4;
  String cussignUrl = '<>';
  final String date;
  final String time;
  final String servicename;

  ServiceReportPDF({
    required this.customer_name,
    required this.department,
    required this.model,
    required this.contract,
    required this.contract_no,
    required this.sn,
    required this.manufacturer,
    required this.Installation,
    required this.Commissioning,
    required this.ServiceContract,
    required this.Warranty,
    required this.ServiceCall,
    required this.PM,
    required this.Workshop,
    required this.Internal,
    required this.status,
    required this.fault,
    required this.workdone,
    required this.remark,
    required this.partnumber1,
    required this.partname1,
    required this.partnumber2,
    required this.partname2,
    required this.partnumber3,
    required this.partname3,
    required this.partnumber4,
    required this.partname4,
    required this.cussignUrl,
    required this.date,
    required this.time,
    required this.servicename,
  });
}
