import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/DeviceModel_controller.dart';
import 'package:service_record/Model/DeviceModel.dart';

import 'package:service_record/Service/DeviceModel_service.dart';
import 'package:service_record/pages/add_device/List_Device.dart';

class List_DeviceModel extends StatefulWidget {
  @override
  State<List_DeviceModel> createState() => _List_DeviceModelState();
}

class _List_DeviceModelState extends State<List_DeviceModel> {
  List<DeviceModel> deviceModel = List.empty();
 String name ='';
  bool isLoading = false;

  DeviceModelController controller =
      DeviceModelController(DeviceModelService());
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
   name= context.read<DevicesnameModel>().DeviceName;
    _getdeviceModelInfo(name);
  }

  void _getdeviceModelInfo(String name) async {
    var newdeviceModel = await controller.fetchdeviceModelInfo(name);
    setState(() {
      deviceModel = newdeviceModel;
    });
  }

  void add_devicemodel(
    String devicename,
    Model,
  ) async {
    controller.add_devicemodel(
      devicename,
      Model,
    );
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
          thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemCount: !deviceModel.isEmpty ? deviceModel.length : 1,
            itemBuilder: (context, index) {
              if (!deviceModel.isEmpty) {
                return InkWell(
                  onTap: () {
                    context.read<DeviceModel_Model>().Model =
                        '${deviceModel[index].Model}';
      
                    Navigator.pop(context, '${deviceModel[index].Model}');
                    print('${deviceModel[index].Model}');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(.0),
                    height: 50,
                    child: Center(child: Text('${deviceModel[index].Model}',
                    style: TextStyle(fontSize: 18),
                    )),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Not Found Model',
                      style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                );
              }
            }),
      );
  Future<void> _adddevicemodel(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    String _devicename = context.read<DevicesnameModel>().DeviceName;
    String _model = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formkey,
          child: AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Add Device model'),
            ),
            content: SizedBox(
              height: 250,
              child: Column(
                children: [
                  TextFormField(
                    readOnly: true,
                    initialValue: _devicename,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Device name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Device name';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      _devicename = newValue!;
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Please fill Model'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Model',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Model';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      _model = newValue!;
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
                    add_devicemodel( _devicename,_model);
                    _getdeviceModelInfo(name);
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
      appBar: AppBar( actions: [
            GestureDetector(
                child: IconButton(
              onPressed: () {
                _adddevicemodel(context);
              },
              icon: Icon(Icons.add),
              iconSize: 30,
            )),
          ],
        title: Text('Choose Device Model'),
      ),
      body: Center(child: body),
      //     floatingActionButton: FloatingActionButton(
      //     onPressed: _getdeviceModelInfo(),
      //     child: Icon(Icons.add),
      // )
    );
  }
}

class DeviceModel_Model extends ChangeNotifier {
  String _Model = '';
  String get Model => this._Model;

  set Model(String value) {
    this._Model = value;
    notifyListeners();
  }
}
