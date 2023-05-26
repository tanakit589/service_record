import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Checklist_Istat1_model.dart';

class Checklist_Istat1Service {
  Future<List<Checklist_Istat1>> get_service_report() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('CheckList_istat1').get();
    AllChecklist_Istat1 checklist_istat1s =
        AllChecklist_Istat1.fromSnapshot(snapshot);
    return checklist_istat1s.checklist_istat1s;
  }

  Future<List<Checklist_Istat1>> getChecklist(String jobId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('CheckList_istat1')
        .where('jobId', isEqualTo: jobId)
        .get();
    AllChecklist_Istat1 checklist_istat1s =
        AllChecklist_Istat1.fromSnapshot(snapshot);
    return checklist_istat1s.checklist_istat1s;
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
    FirebaseFirestore.instance.collection('CheckList_istat1').add({
      'id': '',
      'sn': sn,
      'hospital': hospital,
      'department': department,
      'no1': no1,
      'no2_Jams': no2_Jams,
      'no2_Clew': no2_Clew,
      'no3_a': no3_a,
      'no3_b': no3_b,
      'no4_a': no4_a,
      'no4_b': no4_b,
      'no4_c': no4_c,
      'no4_d': no4_d,
      'no4_e': no4_e,
      'no4_f': no4_f,
      'no5_a': no5_a,
      'no5_b': no5_b,
      'no5_c': no5_c,
      'no6': no6,
      'no7': no7,
      'no8': no8,
      'jamsVer': jamsVer,
      'clewVer': clewVer,
      'remarks': remarks,
      'jobId': jobId,
      'cussign': cussign,
      'servicename':servicename,
      'temp':temp,
      'date':date,
    }).then((value) => FirebaseFirestore.instance
            .collection('CheckList_istat1')
            .doc(value.id)
            .update({
          'id': value.id,
        }));
  }
}

  
