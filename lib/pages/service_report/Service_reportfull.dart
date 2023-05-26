import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:provider/provider.dart';
import 'package:service_record/pages/service_report/service_reportpage1.dart';
import 'package:service_record/pages/service_report/service_reportpage2.dart';
import 'package:service_record/pages/service_report/service_reportpage3.dart';
import 'package:service_record/pages/service_report/service_reportpage4.dart';

class service_reportPagefull extends StatefulWidget {
  @override
  State<service_reportPagefull> createState() =>
      _service_reportPagefullfState();
}

class _service_reportPagefullfState extends State<service_reportPagefull> {
  bool _Installation = false;
  // context.read<ListTypeServiceModel>().Customer_name;
  bool _Commissioning = false;
  bool _ServiceContract = false;
  bool _Warranty = false;
  bool _ServiceCall = false;
  bool _PM = false;
  bool _Workshop = false;
  bool _Internal = false;
  DateTime time = DateTime.now();
  String selected = "";
  List _checkListItems = [
   {'title':'Complete',
    'value':false},
   { 'title':'In Progress',
    'value':false},
     { 'title':'Quotation',
    'value':false},
    
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 218, 217, 217),
      body: SafeArea(
        top: false,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Table(
                  // border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(150),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(64),
                  },
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Text(
                          'transmedic',
                          style: TextStyle(fontSize: 24),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Transmedic (Thailand) Co., Ltd.'),
                              Text(
                                '888/87-89 (8th FL.), 888/209 (2nd FL.), Mahatun ',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Text(
                          'advancing medical technologies',
                          style: TextStyle(fontSize: 8.5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Plaza Building,Lumpini, Patumwan, Bangkok 10330',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              'TEL: 022550405-8 FAX: 02-2550409',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Text(
                          'SERVICE REPORT CUM DELIVERY ORDER',
                          // style: TextStyle(fontSize: 20),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.bottom,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'No. 1 00974',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                    height: 25,
                    width: 400,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      'Customer Information',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(200),
                  },
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Text(
                          '  Customer   TUH',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '  Dept.  OR ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Text(
                          '  Contact   ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '  Contact No.   ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Text(
                          '  Serial Number   111111',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '  Model   300G',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only( left: 10, right: 10),
                child: Container(
                    height: 25,
                    width: 400,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '  Manufracturer   iSTAT1',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                    height: 25,
                    width: 400,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '  Type of Service',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Consumer<ListTypeServiceModel>(
                    builder: (context, value, child) {
                  return Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(130),
                    },
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Container(
                            height: 50,
                            //width: 40,
                            //alignment: AlignmentDirectional.topStart ,
                            child: CheckboxListTile(
                              title: Text(
                                'Installation',
                                style: TextStyle(fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.only(left: 0),
                              side: BorderSide(width: 2),
                              value: value.Installation,
                             // _Installation,
                              onChanged: ((value) {
                                setState(() {
                                  _Installation = value!;
                                });
                              }),
                            ),
                          ),
                          Container(
                            height: 50,
                            //width: 40,
                            //alignment: AlignmentDirectional.topStart ,
                            child: CheckboxListTile(
                              title: Text(
                                'Service Call',
                                style: TextStyle(fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.only(left: 0),
                              side: BorderSide(width: 2),
                              value: value.ServiceCall,
                              onChanged: ((value) {
                                setState(() {
                                  _ServiceCall = value!;
                                });
                              }),
                            ),
                          ),
                          Container(
                            height: 50,
                            //width: 40,
                            //alignment: AlignmentDirectional.topStart ,
                            child: CheckboxListTile(
                              title: Text(
                                'Workshop',
                                style: TextStyle(fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.only(left: 0),
                              side: BorderSide(width: 2),
                              value: value.Workshop,
                              onChanged: ((value) {
                                setState(() {
                                  _Workshop = value!;
                                });
                              }),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Container(
                            height: 50,
                            //width: 40,
                            //alignment: AlignmentDirectional.topStart ,
                            child: CheckboxListTile(
                              title: Text(
                                'Commissioning',
                                style: TextStyle(fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.only(left: 0),
                              side: BorderSide(width: 2),
                              value: value.Commissioning,
                              onChanged: ((value) {
                                setState(() {
                                  _Commissioning = value!;
                                });
                              }),
                            ),
                          ),
                          Container(
                            height: 50,
                            //width: 40,
                            //alignment: AlignmentDirectional.topStart ,
                            child: CheckboxListTile(
                              title: Text(
                                'PM',
                                style: TextStyle(fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.only(left: 0),
                              side: BorderSide(width: 2),
                              value: value.PM,
                              onChanged: ((value) {
                                setState(() {
                                  _PM = value!;
                                });
                              }),
                            ),
                          ),
                          Container(
                            height: 50,
                            //width: 40,
                            //alignment: AlignmentDirectional.topStart ,
                            child: CheckboxListTile(
                              title: Text(
                                'Internal',
                                style: TextStyle(fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.only(left: 0),
                              side: BorderSide(width: 2),
                              value: value.Internal,
                              onChanged: ((value) {
                                setState(() {
                                  _Internal = value!;
                                });
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
             
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Consumer<ListTypeServiceModel>(
                    builder: (context, value, child) {
                  return  Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(130),
                  },
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 50,
                          //width: 40,
                          //alignment: AlignmentDirectional.topStart ,
                          child: CheckboxListTile(
                            title: Text(
                              'Service Contract',
                              style: TextStyle(fontSize: 14),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.only(left: 0),
                            side: BorderSide(width: 2),
                            value: value.ServiceContract,
                            onChanged: ((value) {
                              setState(() {
                                _ServiceContract = value!;
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 50,
                          //width: 40,
                          //alignment: AlignmentDirectional.topStart ,
                          child: CheckboxListTile(
                            title: Text(
                              'Warranty',
                              style: TextStyle(fontSize: 14),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.only(left: 0),
                            side: BorderSide(width: 2),
                            value: value.Warranty,
                            onChanged: ((value) {
                              setState(() {
                                _Warranty = value!;
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
                    }
                )
              ),
                 Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Container(
                    height: 25,
                    width: 400,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '  Status',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
               Consumer<ListTypeServiceModel>(
                    builder: (context, value, child) {
                  return  Padding(
                  padding: const EdgeInsets.only( left: 10, right: 10),
                   child: Container( 
                    decoration: BoxDecoration(
                      border: Border.all()
                    ),
                    child: Column(
                             children: List.generate(
                    _checkListItems.length,
                    (index) => CheckboxListTile(
                    
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          _checkListItems[index]["title"],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      value:value.checkListItems[index]['value'],
                      onChanged: (value) {
                        setState(() {
                          for (var element in _checkListItems) {
                            element["value"] = false;
                          }
                          _checkListItems[index]["value"] = value;
                          // selected =
                          //     "${checkListItems[index]["title"]}";
                          //     print('$selected');
                        });
                      },
                    ),
                             ),
                    ),
                             ),
                 );
                    }
               ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Container(
                    height: 25,
                    width: 400,
                    //decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      'Detailed Report',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Consumer<DetailRepotModel>(
                  builder: (context, value, child) {
                    return TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: 'Fault',
                        hintText: 'Fault detail',
                        labelStyle: TextStyle(fontSize: 20),
                      ),
                      readOnly: true,
                      initialValue: '${value.Fault}',

                      maxLines: 5,
                      scrollPhysics: const BouncingScrollPhysics(),
                      // onSaved: ((newValue) {
                      //   _Fault = newValue!;
                      // }),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Consumer<DetailRepotModel>(
                    builder: (context, value, child) {
                  return TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Work Done',
                      hintText: 'Work done detail',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    initialValue: '${value.WorkDone}',
                    readOnly: true,
                    maxLines: 7,
                    scrollPhysics: const BouncingScrollPhysics(),
                    // onSaved: ((newValue) {
                    //   _WorkDone = newValue!;
                    // }),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Consumer<DetailRepotModel>(
                    builder: (context, value, child) {
                  return TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: 'Remark',
                      hintText: 'Remark detail',
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    initialValue: '${value.Remark}',
                    readOnly: true,
                    maxLines: 7,
                    scrollPhysics: const BouncingScrollPhysics(),
                    // onSaved: ((newValue) {
                    //   _Remark = newValue!;
                    // }),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Container(
                    height: 25,
                    width: 400,
                    //decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      'Spare Parts',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              // Consumer<SparePartModel>(builder: (context, value, child) {
              //   return Container(
              //     height: 150,
              //     child: ListView.builder(
              //       itemCount:
              //           Provider.of<SparePartModel>(context).partnumbercount,
              //       itemBuilder: (context, index) {
              //         // _controllers.add(new TextEditingController());
              //         return Container(
              //           margin: EdgeInsets.all(5),
              //           child: Column(
              //             children: [
              //               value.partnameField[index],
              //               value.partnumberField[index],
              //             ],
              //           ),
              //         );
              //       },
              //     ),
              //   );
              //   ;
              // }),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('The above service was done to my satisfaction.'),
                        Text('Materials delivered as described above.'),
                        Container(
                          width: 300.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              //  border: Border.all(),
                              //color: Colors.white30,
                              ),
                          child: ValueListenableBuilder<String?>(
                            valueListenable: CusSign,
                            builder: (context, data, child) {
                              return HandSignatureView.svg(
                                data: data,
                                padding: EdgeInsets.all(8.0),
                                placeholder: Container(
                                  // color: Color.fromARGB(255, 255, 255, 255),
                                  child: Center(
                                    child: Text(''),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Name and Signature',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Designation / Department',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Company Stamp',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    //0: FixedColumnWidth(130),
                  },
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Date Attended '),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      '${time.day}/${time.month}/${time.year}'),
                                )
                              ],
                            )),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                            height: 50,
                            //width: 40,
                            //alignment: AlignmentDirectional.topStart ,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Time'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${time.hour}:${time.minute}'),
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Transmedic Engineer '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Tanakit'),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

