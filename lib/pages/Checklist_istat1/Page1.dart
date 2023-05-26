import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/pages/Checklist_istat1/Page2.dart';
import 'package:service_record/pages/ListJob.dart';




class Checklist_istat_Page1 extends StatefulWidget {
  @override
  State<Checklist_istat_Page1> createState() => _Checklist_istat_Page1State();
}

class _Checklist_istat_Page1State extends State<Checklist_istat_Page1> {
   final _formkey = GlobalKey<FormState> ();
   late String _SerialNumber ;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Page 1'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('i-STAT1')),
          )
        ],
      ),
      body: Consumer<CustomerDeviceData>(
                      builder: (context, value, child) {
                    return SingleChildScrollView(
          child: Form(
             key: _formkey , 
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Device Information',
                    style: TextStyle(fontSize: 20),
                  )),
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
                          initialValue: '${value.sn}',
                        //  readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Serial Number',
                            hintText: 'Serial Number',
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty ){
                            return 'please enter Serial Number';
                          }
                          return null;
                        },
                        
                         ),
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
                           initialValue: '${value.hospital}',
                          // readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Hospital',
                            hintText: 'Hospital',
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty ){
                            return 'please enter Hospital';
                          }
                          return null;
                        },
                     
                         ),
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
                           initialValue: '${value.department}',
                          // readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Location',
                            hintText: 'Location',
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty ){
                            return 'please enter Location';
                          }
                          return null;
                        },
                     
                         ),
                       ),
                     ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(onPressed: (){
                           
                           
                              Navigator.pop(context);
                            
                          }, 
                          child: Text('Back')),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: (){
                       
                       
                          Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> Checklist_istat_Page2()));
                        
                      }, 
                      child: Text('Next')),
                    ),
                        ],
                      ),
                   
              ],
            ),
          ),
        );
                      }
      ),
    );
  }
}
