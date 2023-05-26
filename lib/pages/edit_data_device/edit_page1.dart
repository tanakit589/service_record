import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:service_record/Controller/AddDevice_Info_controller.dart';
import 'package:service_record/Model/AddDevice_Info_model.dart';
import 'package:service_record/Service/AddDevice_Info_service.dart';
import 'package:service_record/widgets/drawer.dart';

class EditPage extends StatefulWidget {
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  String _id='';
  TextEditingController _hospitalController = TextEditingController();
  TextEditingController _devicenameController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _manufacturerController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _warratyController = TextEditingController();

  List<AddDevice> deviceinfo = List.empty();
  AddDeviceController controller = AddDeviceController(AddDeviceService());
  AddDeviceController controller_updatedeviceData = AddDeviceController(AddDeviceService());

  void _getDevice_InforInfo(String sn) async {
    var newdeviceinfo = await controller.fetchDeviceInfo(sn);
    setState(() {
      deviceinfo = newdeviceinfo;
      _devicenameController.text = '${deviceinfo[0].device_name}';
      _hospitalController.text = '${deviceinfo[0].hospital}';
      _departmentController.text = '${deviceinfo[0].department}';
      _modelController.text = '${deviceinfo[0].model}';
      _contactController.text = '${deviceinfo[0].contact}';
      _manufacturerController.text ='${deviceinfo[0].manufacturer}';
      _warratyController.text='${deviceinfo[0].date}';
      _id='${deviceinfo[0].id}';
    });
  }

 void _updateDevice(String date,sn,device_name,model,
  manufacturer,hospital,department,contact,id ) async{
    controller.updateDevice( date, sn, device_name, model, manufacturer, hospital, department, contact,id);
  }

  TextEditingController _date = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late String date;
  late String _sn;
  late String _DeviceName;
  late String _model;
  late String _Manufacturer;
  late String _hospital;
  late String _Department;
  late String _Contact;
  bool _lock = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: Text('Edit device information'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0, bottom: 8,right: 8,top: 20),
                child: Container(
                  decoration: BoxDecoration(
                            boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                            ]
                          ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Serial Number',
                      hintText: 'Serial Number',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          await {_getDevice_InforInfo(_sn)};
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter SSerial NumberN';
                      }
                      return null;
                    },
                    onChanged: ((newValue) {
                      setState(() {
                        _sn = newValue;
                      });
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                            boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                            ]
                          ),
                  child: TextFormField(
                    controller: _devicenameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Device Name',
                      hintText: 'Device Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter device name';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _DeviceName = newValue!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                            boxShadow: [
                        BoxShadow(
                           color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                            ]
                          ),
                  child: TextFormField(
                    controller: _modelController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Model',
                      hintText: 'Model',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Model';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _model = newValue!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                            boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                            ]
                          ),
                  child: TextFormField(
                    controller: _manufacturerController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Manufacturer',
                      hintText: 'Manufacturer',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Manufacturer';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _Manufacturer = newValue!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                            boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                            ]
                          ),
                  child: TextFormField(
                    controller: _hospitalController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Hospital',
                      hintText: 'Hospital',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Hospital';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _hospital = newValue!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                            boxShadow: [
                        BoxShadow(
                           color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                            ]
                          ),
                  child: TextFormField(
                    controller: _departmentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Department',
                      hintText: 'Department',
                    ),
                    readOnly: _lock,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Department';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _Department = newValue!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                            boxShadow: [
                        BoxShadow(
                         color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                            ]
                          ),
                  child: TextFormField(
                    controller: _contactController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact',
                      hintText: 'Contact',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Contact';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _Contact = newValue!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                            boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                            ]
                          ),
                  child: TextFormField(
                    
                    controller: _warratyController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Warranty',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickedate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2101));
                          if (pickedate != null) {
                            setState(
                              () {
                                _warratyController.text =
                                    DateFormat('dd/MM/yyyy').format(pickedate);
                              },
                            );
                          }
                        },
                        icon: Icon(Icons.calendar_today_rounded),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select Warranty date';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      date = newValue!;
                    },
                  ),
                ),
              ),
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                       if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                      _updateDevice(
                        date,
                        _sn,
                        _DeviceName,
                        _model,
                        _Manufacturer,
                        _hospital,
                        _Department,
                        _Contact,
                        _id
                      );

                      Navigator.pop(context);
                       ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Saved',
            style: TextStyle(fontSize: 16),)));
                       }
                    },
                    child: Text('Submit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
