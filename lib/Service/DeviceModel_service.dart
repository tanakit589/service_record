import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Device.dart';
import 'package:service_record/Model/DeviceModel.dart';

class DeviceModelService {
  Future<List<DeviceModel>> getdeviceModelInfo(String name) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Model')
        .where('DeviceName', isEqualTo: name)
        .get();

    AllDeviceModel deviceModels = AllDeviceModel.fromSnapshot(snapshot);
    return deviceModels.deviceModels;
  }

  void add_devicemodel(
    String devicename,
    String Model,
  ) async {
    FirebaseFirestore.instance.collection('Model').add({
      'id': '',
      'DeviceName': devicename,
      'Model': Model,
    }).then((value) =>
        FirebaseFirestore.instance.collection('Model').doc(value.id).update({
          'id': value.id,
        }));
  }
}
