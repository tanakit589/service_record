import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Model/service_report_model.dart';

class ServiceReportService {
  Future<List<ServiceReportModel>> get_service_report(String jobId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('ServiceReport')
        .where('job_id', isEqualTo: jobId)
        .get();
    AllServiceReportModel service_reportmodels =
        AllServiceReportModel.fromSnapshot(snapshot);
    return service_reportmodels.service_reportmodels;
  }

  Future<String> add_service_report(
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
    try {
      var reportId =
          await FirebaseFirestore.instance.collection('ServiceReport').add({
        'id': '',
        'customer_name': customer_name,
        'department': department,
        'model': model,
        'contract': contract,
        'contract_no': contract_no,
        'sn': sn,
        'manufacturer': manufacturer,
        'Installation': Installation,
        'Commissioning': Commissioning,
        'ServiceContract': ServiceContract,
        'Warranty': Warranty,
        'ServiceCall': ServiceCall,
        'PM': PM,
        'Workshop': Workshop,
        'Internal': Internal,
        'status': status,
        'fault': fault,
        'workdone': workdone,
        'remark': remark,
        'partnumber1': partnumber1,
        'partname1': partname1,
        'partnumber2': partnumber2,
        'partname2': partname2,
        'partnumber3': partnumber3,
        'partname3': partname3,
        'partnumber4': partnumber4,
        'partname4': partname4,
        'cussignUrl': cussignUrl,
        'date': date,
        'time': time,
        'servicename': servicename,
        'job_id': jobId,
      });
      return reportId.id;
    } catch (e) {
      throw (e);
    }
  }

  void updatereportId(String reportId) async {
    FirebaseFirestore.instance.collection('ServiceReport').doc(reportId).update({
      'id': reportId,
    });
  }
}
