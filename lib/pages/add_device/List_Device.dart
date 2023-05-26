import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/Device_controller.dart';
import 'package:service_record/Controller/Hospital_controller.dart';
import 'package:service_record/Model/Device.dart';
import 'package:service_record/Model/Hospital_Model.dart';
import 'package:service_record/Service/Device_service.dart';
import 'package:service_record/Service/hospital_service.dart';

class List_Device extends StatefulWidget {
  @override
  State<List_Device> createState() => _List_DeviceState();
}

class _List_DeviceState extends State<List_Device> {
  bool isLoading = false;
  List<Device> device = List.empty();
  DeviceController controller = DeviceController(DeviceService());
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    _getdeviceInfo();
  }

  void _getdeviceInfo() async {
    var newdevice = await controller.fetchdeviceInfo();
    setState(() => device = newdevice);
  }

  void add_devicename(
    manufacturer,
    name,
  ) async {
    controller.add_devicename(
      manufacturer,
      name,
    );
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
          thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount: !device.isEmpty ? device.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!device.isEmpty) {
                return InkWell(
                  onTap: () {
                    context.read<DevicesnameModel>().DeviceName =
                        '${device[index].name}';
                    context.read<DevicesnameModel>().Manufacturer =
                        '${device[index].manufacturer}';
                    Navigator.pop(context, '${device[index].name}');
                    print('${device[index].name}');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 50,
                    child: Center(child: Text('${device[index].name}',
                    style: TextStyle(fontSize: 18),)),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Not Found device',
                      style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                );
              }
            }),
      );

  Future<void> _adddevicename(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    String _devicename = '';
    String _manufacturer = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formkey,
          child: AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Add Device name'),
            ),
            content: SizedBox(
              height: 250,
              child: Column(
                children: [
                  Text('Please fill Manufacturer'),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Manufacturer',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Manufacturer';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      _manufacturer = newValue!;
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Please fill Device name'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Device Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Device name';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      _devicename = newValue!;
                    }),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    add_devicename(_manufacturer, _devicename);
                    _getdeviceInfo();
                    Navigator.of(context).pop();
                    
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                child: IconButton(
              onPressed: () {
                _adddevicename(context);
              },
              icon: Icon(Icons.add),
              iconSize: 30,
            )),
          ],
          title: Text('Choose Device Name'),
        ),
        body: Center(child: body));
  }
}

class DevicesnameModel extends ChangeNotifier {
  String _DeviceName = '';
  String get DeviceName => this._DeviceName;

  set DeviceName(String value) {
    this._DeviceName = value;
    notifyListeners();
  }

  String _Manufacturer = '';
  String get Manufacturer => this._Manufacturer;

  set Manufacturer(String value) {
    this._Manufacturer = value;
    notifyListeners();
  }
}
