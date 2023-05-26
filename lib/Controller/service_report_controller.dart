import 'dart:async';

import 'package:flutter/material.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Model/service_report_model.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/Service/service_report_service.dart';

class ServiceReportController {
  final ServiceReportService services;
  List<ServiceReportModel> service_reportmodels = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  ServiceReportController(this.services);

  Future<List<ServiceReportModel>> fetch_service_report(String jobId) async{
    onSyncController.add(true);
    service_reportmodels = await services.get_service_report(jobId);
    onSyncController.add(false);
    return service_reportmodels;

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
        String reportId = await
    services.add_service_report(
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
  void updatereportId(String reportId) async{
    services.updatereportId(reportId);
  }
  
}
