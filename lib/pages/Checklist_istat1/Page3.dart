import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/pages/Checklist_istat1/Checklist_Istat1_ConsumerModel.dart';
import 'package:service_record/pages/Checklist_istat1/Page4.dart';

class Checklist_istat_Page3 extends StatefulWidget {
  @override
  State<Checklist_istat_Page3> createState() => _Checklist_istat_Page3State();
}

class _Checklist_istat_Page3State extends State<Checklist_istat_Page3> {
  final _formkey = GlobalKey<FormState>();

  bool _no4_a = false;
  bool _no4_b = false;
  bool _no4_c = false;
  bool _no4_d = false;
  bool _no4_e = false;
  bool _no4_f = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Page 3'),
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
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '4. Run simulator, check keys and scanner operation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Table( 
                  border:TableBorder.all(
                  borderRadius:  BorderRadius.circular(10),
                ) , children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: CheckboxListTile(
                          title: Text(
                              'Insert Electronics Simulator. The analyzer cycle should begin upon Simulator insertion. '),
                          value: _no4_a,
                          onChanged: ((value) {
                            setState(() {
                              _no4_a = value!;
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
                              'Verify that keys operate properly by entering Operator # as follows: Press the 123456789.0 and ABC keys and left/right arrow to change the letter. '),
                          value: _no4_b,
                          onChanged: ((value) {
                            setState(() {
                              _no4_b = value!;
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
                              'Press the ABC key again, the cursor moves to the right.'),
                          value: _no4_c,
                          onChanged: ((value) {
                            setState(() {
                              _no4_c = value!;
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
                              'Verify that the left key clears (clear back till the display reads 123456789 and hit the ENTER key. )'),
                          value: _no4_d,
                          onChanged: ((value) {
                            setState(() {
                              _no4_d = value!;
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
                              'When prompted for the Simulator ID scan any bar code to verify that the scan works properly.'),
                          value: _no4_e,
                          onChanged: ((value) {
                            setState(() {
                              _no4_e = value!;
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
                              'Record PASS/FAIL indication from Electronic Simulator.'),
                          value: _no4_f,
                          onChanged: ((value) {
                            setState(() {
                              _no4_f = value!;
                            });
                          }),
                        ),
                      ),
                    ],
                  ),
                ]),
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
                          context.read<Checklist_Istat1_ConsumerModel>()
                            ..no4_a = _no4_a
                            ..no4_b = _no4_b
                            ..no4_c = _no4_c
                            ..no4_d = _no4_d
                            ..no4_e = _no4_e
                            ..no4_f = _no4_f;
                            
                           
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Checklist_istat_Page4()));
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
