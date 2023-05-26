import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_record/Model/Device.dart';
import 'package:service_record/Model/Hospital_Model.dart';




class DeviceService{
  Future<List<Device>> getdeviceInfo() async{
    QuerySnapshot snapshot= 
    await FirebaseFirestore.instance.collection('Device').get();

    AllDevice devices = AllDevice.fromSnapshot(snapshot);
    return devices.devices;


  }
  
   void add_devicename(
     
     String manufacturer,
     String name,
     
      ) async {
    FirebaseFirestore.instance.collection('Device').add({
      'id': '',
      'manufacturer': manufacturer,
      'name': name,
      
    }).then((value) => FirebaseFirestore.instance
            .collection('Device')
            .doc(value.id)
            .update({
          'id': value.id,
        }));
  }
 

}