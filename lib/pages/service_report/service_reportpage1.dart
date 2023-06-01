import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:service_record/pages/ListJob.dart';
import 'package:service_record/pages/service_report/service_reportpage2.dart';
import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';


class service_reportpage1 extends StatefulWidget {
  @override
  State<service_reportpage1> createState() => _service_reportPageState();
}

class _service_reportPageState extends State<service_reportpage1> {
  
  final _formkey = GlobalKey<FormState> ();
   String _Customer_name = ''; // late คือประกาศเป็นค่าว่างไว้ รอเอามาใส่
   String _Department = '';
   String _Contact= ' ';
   String _Contact_No = '';
   String _Serial_Number = '';
   String _Model = '';
   String _Manufacturer = '';  

  //bool _hidepassword = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title:  Text('Service_report\nPage 1'),
      ),
      body: Consumer<CustomerDeviceData>(
                      builder: (context, value, child) {
                    return  SingleChildScrollView(
          child: 
          Column(
            
          children: [
            Form( 
              key: _formkey , // เอาไว้เก็บสถานะของฟอร์ม
              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Customer Infomation',style: TextStyle(fontSize: 20),),
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
                          initialValue: '${value.hospital}',
                         readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Customer Name',
                            hintText: 'Customer Name',
                            ),
                        validator: (value) {
                          if (value == null || value.isEmpty ){
                            return 'please enter Customer Name';
                          }
                          return null;
                        },
                        onSaved: ((newValue) {
                          _Customer_name = newValue! ;
                        }
                        ),
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
                      ],
                         ),
                        child: TextFormField(decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Department',
                            hintText: 'Department',
                            ),
                            initialValue: '${value.department}',
                            readOnly: true,
                            validator: (value){
                              if(value == null ||value.isEmpty){
                                return 'please enter your Department';
              
                              }
                              return null;
                            },
                            onSaved: (newValue) => _Department = newValue! ,
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
                      ],
                         ),
                        child: TextFormField(
                          initialValue: '${value.contact}',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contact',
                            hintText: 'Contact',
                            
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return null;
              
                              }
                              return null;
                            },
                             onSaved: (newValue) => _Contact = newValue!,
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
                      ],
                         ),
                        child: TextFormField(
                           initialValue: '${value.contact_no}',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contact No.',
                            hintText: 'Contact No.',
                            
                            ),
                           validator: (value) {
                              if (value == null || value.isEmpty){
                                return null;
              
                              }
                              return null;
                            },
                            onSaved: (newValue) => _Contact_No = newValue!,
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
                      ],
                         ),
                        child: TextFormField(
                          initialValue: '${value.sn}',
                        readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Serial number',
                            hintText: 'Serial number',
                            
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'please enter Serial number';
              
                              }
                              return null;
                            },
                            onSaved: (newValue) => _Serial_Number = newValue!,
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
                      ],
                         ),
                        child: TextFormField(
                           initialValue: '${value.model}',
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Model',
                            hintText: 'Model',
                            
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'please enter Model';
              
                              }
                              return null;
                            },
                            onSaved: (newValue) => _Model = newValue!,
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
                      ],
                         ),
                        child: TextFormField(
                          initialValue: '${value.device_name}',
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Manufacturer',
                            hintText: 'Manufacturer',
                            
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'please enter Manufacturer';
              
                              }
                              return null;
                            },
                            onSaved: (newValue) => _Manufacturer = newValue!,
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
                  
                   child: Text('back')
                   ),
                    ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(onPressed: (){
                           
                            if(_formkey.currentState!.validate()){
                              _formkey.currentState!.save();
                              context.read<CustomerProfileModel>()
                              ..Customer_name = _Customer_name
                              ..Department = _Department
                              ..Contact = _Contact
                              ..Contact_No = _Contact_No
                              ..Serial_Number = _Serial_Number
                              ..Model = _Model
                              ..Manufacturer = _Manufacturer;
                              Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> service_reportPage2()));
                            }
                          }, 
                          child: Text('Next')),
                        ),
                      ],
                    ),
                    //  Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: ElevatedButton(onPressed: (){
                       
                       
                    //       Navigator.push(context,
                    // MaterialPageRoute(builder: (context)=> service_reportPage2()));
                        
                    //   }, 
                    //   child: Text('Next test')),
                    // )
                  ],
                ),
              ),
          ],
        ),
        );
                      }
      ),
      );
    
  }
}

class CustomerProfileModel extends ChangeNotifier{
   String _Customer_name = ''; // late คือประกาศเป็นค่าว่างไว้ รอเอามาใส่
   String _Department = '';
   String _Contact= ' ';
   String _Contact_No = '';
   String _Serial_Number = '';
   String _Model = '';
   String _Manufacturer = '';  
  get Customer_name => this._Customer_name;

 set Customer_name( value) { this._Customer_name = value;
  notifyListeners();
 }

  get Department => this._Department;

 set Department( value) { this._Department = value;
notifyListeners();
 }

  get Contact => this._Contact;

 set Contact( value) { this._Contact = value;
notifyListeners();
 }

  get Contact_No => this._Contact_No;

 set Contact_No( value) { this._Contact_No = value;
 notifyListeners();
 }

  get Serial_Number => this._Serial_Number;

 set Serial_Number( value) { this._Serial_Number = value;
notifyListeners();
 }

  get Model => this._Model;

 set Model( value) { this._Model = value;
 notifyListeners();
 }

  get Manufacturer => this._Manufacturer;

 set Manufacturer( value) { this._Manufacturer = value;
 notifyListeners();
 }


}
