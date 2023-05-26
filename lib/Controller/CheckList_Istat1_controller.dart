import 'dart:async';

import 'package:flutter/material.dart';
import 'package:service_record/Model/Checklist_Istat1_model.dart';
import 'package:service_record/Service/CheckList_Istat1_service.dart';

class Checklist_Istat1Controller {
  final Checklist_Istat1Service services;
  List<Checklist_Istat1> checklist_istat1s = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  Checklist_Istat1Controller(this.services);
    
    Future<List<Checklist_Istat1>> fetchChecklist(String jobId) async{
    onSyncController.add(true);
    checklist_istat1s = await services.getChecklist(jobId);
    onSyncController.add(false);
    return checklist_istat1s;

  }


  void add_checklist_istat1(
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
    services.add_checklist_istat1(
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
}
