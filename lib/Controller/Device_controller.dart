import 'dart:async';

import 'package:service_record/Model/Device.dart';
import 'package:service_record/Service/Device_service.dart';

class DeviceController {
  final DeviceService services;
  List<Device> devices = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  DeviceController(this.services);

  Future<List<Device>> fetchdeviceInfo() async {
    onSyncController.add(true);
    devices = await services.getdeviceInfo();
    onSyncController.add(false);
    return devices;
  }

  void add_devicename(
    String manufacturer,
    name,
  ) async {
    services.add_devicename(
      manufacturer,
      name,
    );
  }
}
