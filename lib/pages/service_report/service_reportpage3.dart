import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:service_record/pages/ListJob.dart';

import 'package:service_record/pages/service_report/service_reportpage1.dart';
import 'package:service_record/pages/service_report/service_reportpage2.dart';
import 'package:service_record/pages/service_report/service_reportpage4.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';

class service_reportPage3 extends StatefulWidget {
  @override
  State<service_reportPage3> createState() => _service_reportPageState();
}

class _service_reportPageState extends State<service_reportPage3> {
  final _formkey = GlobalKey<FormState>();
  String _Fault = '';
  String _WorkDone = '';
  String _Remark = '';
  // List<TextEditingController> _controllers = [];
  String _partnumber1 = '';
  String _partnumber2 = "";
  String _partnumber3 = "";
  String _partnumber4 = "";
  String _partname1 = "";
  String _partname2 = "";
  String _partname3 = "";
  String _partname4 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Detail Report', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: TextFormField(
                    initialValue: 'Error   '+ context.read<CustomerDeviceData>().error_code,
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(),
                      labelText: 'Fault',
                      hintText: 'Fault detail',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    maxLines: 5,
                    scrollPhysics: const BouncingScrollPhysics(),
                    onSaved: ((newValue) {
                      _Fault = newValue!;
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
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Work Done',
                      hintText: 'Work done detail',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    maxLines: 7,
                    scrollPhysics: const BouncingScrollPhysics(),
                    onSaved: ((newValue) {
                      _WorkDone = newValue!;
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
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Remark',
                      hintText: 'Remark detail',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    maxLines: 7,
                    scrollPhysics: const BouncingScrollPhysics(),
                    onSaved: ((newValue) {
                      _Remark = newValue!;
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Spare Part', style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                             color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '1. Part number ',
                          hintText: '1. Part number ',
                          labelStyle: TextStyle(fontSize: 20),
                        ),
                        onSaved: ((newValue) {
                          _partnumber1 = newValue!;
                        }),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                             color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '1. Part name  ',
                          hintText: '1. Part name   ',
                          labelStyle: TextStyle(fontSize: 20),
                        ),
                        onSaved: ((newValue) {
                          _partname1 = newValue!;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                                blurStyle: BlurStyle.outer)
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                                  blurStyle: BlurStyle.outer)
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '2. Part number ',
                              hintText: '2. Part number ',
                              labelStyle: TextStyle(fontSize: 20),
                            ),
                            onSaved: ((newValue) {
                              _partnumber2 = newValue!;
                            }),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                             color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '2. Part name  ',
                          hintText: '2. Part name   ',
                          labelStyle: TextStyle(fontSize: 20),
                        ),
                        onSaved: ((newValue) {
                          _partname2 = newValue!;
                        }),
                       
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                         decoration: BoxDecoration(
                          boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                      ],
                         ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '3. Part number ',
                            hintText: '3. Part number ',
                            labelStyle: TextStyle(fontSize: 20),
                          ),
                          onSaved: ((newValue) {
                            _partnumber3 = newValue!;
                          }),
                        ),
                      ),
                    ),
                    Container(
                       decoration: BoxDecoration(
                          boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                      ],
                         ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '3. Part name  ',
                          hintText: '3. Part name   ',
                          labelStyle: TextStyle(fontSize: 20),
                        ),
                        onSaved: ((newValue) {
                          _partname3 = newValue!;
                        }),
                    
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                         decoration: BoxDecoration(
                          boxShadow: [
                        BoxShadow(
                           color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                      ],
                         ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '4. Part number ',
                            hintText: '4. Part number ',
                            labelStyle: TextStyle(fontSize: 20),
                          ),
                          onSaved: ((newValue) {
                            _partnumber4 = newValue!;
                          }),

                        ),
                      ),
                    ),
                    Container(
                       decoration: BoxDecoration(
                          boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                      ],
                         ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '4. Part name  ',
                          hintText: '4. Part name   ',
                          labelStyle: TextStyle(fontSize: 20),
                        ),
                        onSaved: ((newValue) {
                          _partname4 = newValue!;
                        }),
                      
                      ),
                    ),
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('back')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();

                            context.read<DetailRepotModel>()
                              ..Fault = _Fault
                              ..Remark = _Remark
                              ..WorkDone = _WorkDone;
                            context.read<SparePartModel>()
                              ..partnumber1 = _partnumber1
                              ..partnumber2 = _partnumber2
                              ..partnumber3 = _partnumber3
                              ..partnumber4 = _partnumber4
                              ..partname1 = _partname1
                              ..partname2 = _partname2
                              ..partname3 = _partname3
                              ..partname4 = _partname4;

                            // print('${test1}, ${test2}, ${_WorkDone}');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        service_reportpage4()));
                          }
                        },
                        child: Text('next')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailRepotModel extends ChangeNotifier {
  String _Fault = '';
  String _WorkDone = '';
  String _Remark = '';
  get Fault => this._Fault;

  set Fault(value) {
    this._Fault = value;
    notifyListeners();
  }

  get WorkDone => this._WorkDone;

  set WorkDone(value) {
    this._WorkDone = value;
    notifyListeners();
  }

  get Remark => this._Remark;

  set Remark(value) {
    this._Remark = value;
    notifyListeners();
  }
}

class SparePartModel extends ChangeNotifier {
  String _partnumber1 = '';
  String _partnumber2 = '';
  String _partnumber3 = '';
  String _partnumber4 = '';
  String _partname1 = '';
  String _partname2 = '';
  String _partname3 = '';
  String _partname4 = '';
  get partnumber1 => this._partnumber1;

  set partnumber1(value) {
    this._partnumber1 = value;
    notifyListeners();
  }

  get partnumber2 => this._partnumber2;

  set partnumber2(value) {
    this._partnumber2 = value;
    notifyListeners();
  }

  get partnumber3 => this._partnumber3;

  set partnumber3(value) {
    this._partnumber3 = value;
    notifyListeners();
  }

  get partnumber4 => this._partnumber4;

  set partnumber4(value) {
    this._partnumber4 = value;
    notifyListeners();
  }

  get partname1 => this._partname1;

  set partname1(value) {
    this._partname1 = value;
    notifyListeners();
  }

  get partname2 => this._partname2;

  set partname2(value) {
    this._partname2 = value;
    notifyListeners();
  }

  get partname3 => this._partname3;

  set partname3(value) {
    this._partname3 = value;
    notifyListeners();
  }

  get partname4 => this._partname4;

  set partname4(value) {
    this._partname4 = value;
    notifyListeners();
  }
}
