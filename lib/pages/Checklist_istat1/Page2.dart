import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/pages/Checklist_istat1/Checklist_Istat1_ConsumerModel.dart';
import 'package:service_record/pages/Checklist_istat1/Page3.dart';

class Checklist_istat_Page2 extends StatefulWidget {
  @override
  State<Checklist_istat_Page2> createState() => _Checklist_istat_Page2State();
}

class _Checklist_istat_Page2State extends State<Checklist_istat_Page2> {
  final _formkey = GlobalKey<FormState>();

  bool _no1 = false;
  bool _no2_Jams = false;
  bool _no2_Clew = false;
  String _jamsVer ='';
  String _clewVer ='';
  bool _no3_a = false;
  bool _no3_b = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Page 2'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('i-STAT1')),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Padding(
                padding: const EdgeInsets.only(top:20 , left: 2, right: 2),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
                  child: CheckboxListTile(
                    title: Text('1. Clean the external surface',style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16
                ),),
                    value: _no1,
                    onChanged: ((value) {
                      setState(() {
                        _no1 = value!;
                      });
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2. Software version ',style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                   decoration: BoxDecoration(border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
                  child: Table(
                     
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                              
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'JAMS',
                                  hintText: 'JAMS',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter JAMS';
                                  }
                                  return null;
                                },
                                onSaved: ((newValue) {
                                  _jamsVer = newValue! ;
                                }
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CheckboxListTile(
                                // title: Text('2. Software version - '),
                                value: _no2_Jams,
                                onChanged: ((value) {
                                  setState(() {
                                    _no2_Jams = value!;
                                  });
                                }),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                // initialValue: 'TUH',
                                //  readOnly: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CLEW',
                                  hintText: 'CLEW',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter CLEW';
                                  }
                                  return null;
                                },
                                onSaved: ((newValue) {
                                  _clewVer = newValue! ;
                                }
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CheckboxListTile(
                                // title: Text('2. Software version - '),
                                value: _no2_Clew,
                                onChanged: ((value) {
                                  setState(() {
                                    _no2_Clew = value!;
                                  });
                                }),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('3. Visual inspection ',style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                   decoration: BoxDecoration(border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
                  child: Table(border: TableBorder.all(), children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: CheckboxListTile(
                            title: Text(
                                'Verify that the display contrast is set so that the display is easily read. '),
                            value: _no3_a,
                            onChanged: ((value) {
                              setState(() {
                                _no3_a = value!;
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: CheckboxListTile(
                            title: Text('Verify cartridge door springs back. '),
                            value: _no3_b,
                            onChanged: ((value) {
                              setState(() {
                                _no3_b = value!;
                              });
                            }),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if(_formkey.currentState!.validate()){
                          _formkey.currentState!.save();
                          context.read<Checklist_Istat1_ConsumerModel>()
                            ..no1 = _no1
                            ..no2_Clew = _no2_Clew
                            ..no2_Jams = _no2_Jams
                            ..no3_a = _no3_a
                            ..no3_b = _no3_b
                            ..clewVer = _clewVer
                            ..jamsVer = _jamsVer;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Checklist_istat_Page3()));
                        }
                        },
                        child: Text('Next')),
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
