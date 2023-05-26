import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/pages/Checklist_istat1/Checklist_Istat1_ConsumerModel.dart';
import 'package:service_record/pages/Checklist_istat1/Page5.dart';

class Checklist_istat_Page4 extends StatefulWidget {
  @override
  State<Checklist_istat_Page4> createState() => _Checklist_istat_Page4State();
}

class _Checklist_istat_Page4State extends State<Checklist_istat_Page4> {
  final _formkey = GlobalKey<FormState>();
  late String _remarks;
  late String _temp;

  bool _no5_a = false;
  bool _no5_b = false;
  bool _no5_c = false;
  bool _no6 = false;
  bool _no7 = false;
  bool _no8 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Page 4'),
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
                padding: const EdgeInsets.only(left:2.0,top:10,right: 2),
                child: Table(border:TableBorder.all(
                borderRadius:  BorderRadius.circular(10),
                ) , children: <TableRow>[
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '5. Wake-up circuit test',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ]),
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: CheckboxListTile(
                          title: Text(
                              'With simulator installed, press the ON/OFF key to power down the analyzer.'),
                          value: _no5_a,
                          onChanged: ((value) {
                            setState(() {
                              _no5_a = value!;
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
                          title: Text(
                              'Once the unit powered down, press the ON/OFF key to power up.'),
                          value: _no5_b,
                          onChanged: ((value) {
                            setState(() {
                              _no5_b = value!;
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
                          title: Text(
                              'Verify that the analyzer powers up and the message, REMOVE CARTRIDGE appears on the screen.'),
                          value: _no5_c,
                          onChanged: ((value) {
                            setState(() {
                              _no5_c = value!;
                            });
                          }),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 2, left: 2),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
                 
                  child: CheckboxListTile(
                    title: Text(
                        '6. Check time & date and verify backlight operation by pressing 0 (Backlight) keys for 2 seconds.',style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16
                ),),
                    value: _no6,
                    onChanged: ((value) {
                      setState(() {
                        _no6 = value!;
                      });
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 2, left: 2),
                child: Container(
                   decoration: BoxDecoration(border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
                  child: CheckboxListTile(
                    title: Text('7. Verify Printer functionality ',style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16
                ),),
                    value: _no7,
                    onChanged: ((value) {
                      setState(() {
                        _no7 = value!;
                      });
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 2, left: 2),
                child: Container(
                 decoration: BoxDecoration(border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
                  child: CheckboxListTile(
                    title: Text(
                        '8. Test run using electronics simulator x 2 times',style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16
                ),),
                    value: _no8,
                    onChanged: ((value) {
                      setState(() {
                        _no8 = value!;
                      });
                    }),
                  ),
                ),
              ),
              Padding(
               padding: const EdgeInsets.only(left:2.0,top:10,right: 2),
                child: Container(
                   decoration: BoxDecoration(border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
                  child: Table(
                    
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('9 Temperature probe',style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16
                ),)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                            
                              decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                labelText: 'Temp.',
                                hintText: 'Temp.',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter CLEW';
                                }
                                return null;
                              },
                              onSaved: ((newValue) {
                                _temp = newValue! ;
                              }
                              ),
                            ),
                          ),
                         
                        ],
                      ),
                      
                    ]),
              ),
                    
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
                            ]
                          ),
                  child: TextFormField(
                    maxLines: 3,
                    //  initialValue: 'OR',
                    // readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Remark',
                      hintText: 'Remark',
                    ),
                   
                    onSaved: ((newValue) {
                      _remarks = newValue!;
                    }),
                  ),
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
                          ..no5_a = _no5_a
                          ..no5_b = _no5_b
                          ..no5_c = _no5_c
                          ..no6 = _no6
                          ..no7 = _no7
                          ..no8 = _no8
                          ..remarks = _remarks
                          ..temp=_temp;



                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Checklist_istat_Page5()));
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
