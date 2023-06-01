import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/Device_Info_controller.dart';
import 'package:service_record/Controller/Device_controller.dart';
import 'package:service_record/Model/Device_Info_model.dart';
import 'package:service_record/Service/AddDevice_Info_service.dart';
import 'package:service_record/pages/add_device/List_Device.dart';
import 'package:service_record/pages/add_device/List_DeviceModel.dart';
import 'package:service_record/pages/add_device/List_Hospital.dart';
import 'package:service_record/widgets/drawer.dart';
import 'package:intl/intl.dart';

class AddDevice_Page1 extends StatefulWidget {
  @override
  State<AddDevice_Page1> createState() => _AddDevice_Page1State();
}

class _AddDevice_Page1State extends State<AddDevice_Page1> {


  TextEditingController _date = TextEditingController();
  TextEditingController _hosController = TextEditingController();
  TextEditingController _devicenameController = TextEditingController();
  TextEditingController _deviceModelController = TextEditingController();
  TextEditingController _manufracturerController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late String date;
  late String _sn;
  late String _DeviceName;
  late String _model;
  late String _Manufacturer;
  late String _hospital;
  late String _Department;
  late String _Contact;

  
 List<AddDevice> deviceinfo = List.empty();
  AddDeviceController controller = AddDeviceController(AddDeviceService());

  void initStae() {
    super.initState();
  }

   Future _getDevice_InforInfo(String sn) async {
    var newdeviceinfo = await controller.fetchDeviceInfo(sn);
    setState(() {
      deviceinfo = newdeviceinfo;
     
    });
  }

  void _addDevice(String date, sn, device_name, model, manufacturer, hospital,
      department, contact) async {
    controller.addDevice(date, sn, device_name, model, manufacturer, hospital,
        department, contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: drawer(),
      appBar: AppBar(
        title: Text('Add device information'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8,top:20,bottom: 8),
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
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Serial Number';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _sn = newValue!,
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
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => List_Device()));
                          if (context.read<DevicesnameModel>().DeviceName !=
                              null) {
                            setState(
                              () {
                                _devicenameController.text =
                                    context.read<DevicesnameModel>().DeviceName;
                               _manufracturerController.text =
                                    context.read<DevicesnameModel>().Manufacturer;
                              },
                            );
                          }
                          //              Navigator.push(context,
                          // MaterialPageRoute(builder: (context)=> List_Hospital()));
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Device name';
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
                    controller: _deviceModelController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Model',
                      hintText: 'Model',
                       suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => List_DeviceModel()));
                          if (context.read<DeviceModel_Model>().Model !=
                              null) {
                            setState(
                              () {
                                _deviceModelController.text =
                                    context.read<DeviceModel_Model>().Model;
                              },
                            );
                          }
                          //              Navigator.push(context,
                          // MaterialPageRoute(builder: (context)=> List_Hospital()));
                        },
                      ),
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
                    controller:_manufracturerController ,
                    // initialValue: context.read<DeviceModel_Model>().Model,

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
                    controller: _hosController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Hospital',
                      hintText: 'Hospital',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => List_Hospital()));
                          if (context.read<HospitalModel>().hospitalName !=
                              null) {
                            setState(
                              () {
                                _hosController.text =
                                    context.read<HospitalModel>().hospitalName;
                              },
                            );
                          }
                          //              Navigator.push(context,
                          // MaterialPageRoute(builder: (context)=> List_Hospital()));
                        },
                      ),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Department',
                      hintText: 'Department',
                    ),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact',
                      hintText: 'Contact',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
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
                    controller: _date,
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
                                _date.text =
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
              ElevatedButton(
                  onPressed: () async {
                     
                    if (_formkey.currentState!.validate())  {
                      _formkey.currentState!.save();
                    await _getDevice_InforInfo(_sn);
                            if(deviceinfo.isNotEmpty){
                               ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
              duration:Duration(seconds: 2) ,
              content: Text('This serial number already exists in system',
            style: TextStyle(fontSize: 16),)));
                            }
                          else if(deviceinfo.isEmpty) {
                      _addDevice(date, _sn, _DeviceName, _model, _Manufacturer,
                          _hospital, _Department, _Contact);
                      context.read<AddDeviceModel>()
                        ..sn = _sn
                        ..Department = _Department
                        ..Contact = _Contact
                        ..hospital = _hospital
                        ..DeviceName = _DeviceName;

                      Navigator.pop(context);
                        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
              duration:Duration(seconds: 2) ,
              content: Text('Saved',
            style: TextStyle(fontSize: 16),)));
                    }
                    }
                  },
                  child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

class AddDeviceModel extends ChangeNotifier {
  DateTime? date;
  String _sn = '';
  String _DeviceName = '';
  String _hospital = '';
  String _Department = '';
  String _Contact = '';

  get getDate => this.date;

  set setDate(date) {
    this.date = date;
    notifyListeners();
  }

  get sn => this._sn;

  set sn(value) {
    this._sn = value;
    notifyListeners();
  }

  get DeviceName => this._DeviceName;

  set DeviceName(value) {
    this._DeviceName = value;
    notifyListeners();
  }

  get hospital => this._hospital;

  set hospital(value) {
    this._hospital = value;
    notifyListeners();
  }

  get Department => this._Department;

  set Department(value) {
    this._Department = value;
    notifyListeners();
  }

  get Contact => this._Contact;

  set Contact(value) {
    this._Contact = value;
    notifyListeners();
  }
}
