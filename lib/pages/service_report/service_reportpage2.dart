


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/material/colors.dart';
import 'package:group_button/group_button.dart';

import 'package:service_record/pages/service_report/service_reportpage1.dart';
import 'package:service_record/pages/service_report/service_reportpage3.dart';
import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';


class service_reportPage2 extends StatefulWidget {
  @override
  State<service_reportPage2> createState() => _service_reportPageState();
}

class _service_reportPageState extends State<service_reportPage2> {
 String selected = "";
  List checkListItems = [
   {'title':'Completed',
    'value':false},
   { 'title':'In Progress',
    'value':false},
     { 'title':'Quotation',
    'value':false},
    
  ];

  bool _Installation =false;
  bool _Commissioning =false;
  bool _ServiceContract =false;
  bool _Warranty =false;
  bool _ServiceCall =false;
  bool _PM =false;
  bool _Workshop =false;
  bool _Internal =false;
  

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    drawer: drawer(),
    appBar:   
    AppBar(
      
            title: Text('Page 2'),
    ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                            color: Colors.white.withOpacity(1.0),
                            borderRadius: BorderRadius.circular(20)
                            ),
                  child: Text('type of service',style: TextStyle(fontSize: 16),),
                  
                  ),
              ),
        
              
              CheckboxListTile(title: Text('Installation'),
              value: _Installation,
              onChanged: ((value) {
                setState(() {
                  _Installation= value!;
                });
              }),
              ),
                
              
              CheckboxListTile(title: Text('Commissioning'),
              value: _Commissioning,
              onChanged: ((value) {
                setState(() {
              _Commissioning= value!;
                });
              }),
              ),
        
              CheckboxListTile(title: Text('Service Contract'),
              value: _ServiceContract,
              onChanged: ((value) {
                setState(() {
              _ServiceContract= value!;
                });
              }),
              
              ),
        
              CheckboxListTile(title: Text('Warranty'),
              value: _Warranty,
              onChanged: ((value) {
                setState(() {
             _Warranty= value!;
                });
              }),
              ),
              
              CheckboxListTile(title: Text('Service Call'),
              value: _ServiceCall,
              onChanged: ((value) {
                setState(() {
                  _ServiceCall= value!;
                });
              }),
              ),
              
        
              CheckboxListTile(title: Text('PM'),
              value: _PM,
              onChanged: ((value) {
                setState(() {
              _PM= value!;
                });
              }),
              ),
                CheckboxListTile(title: Text('Workshop'),
              value: _Workshop,
              onChanged: ((value) {
                setState(() {
                  _Workshop= value!;
                });
              }),
              ),
                 
                CheckboxListTile(title: Text('Internal'),
              value: _Internal,
              onChanged: ((value) {
                setState(() {
              _Internal= value!;
                });
              }),
              ),
              Divider(
                    height: 10,
                    color: Colors.black,
                    thickness: 5,
              ),
            Text('Status'),
        
               
                
                
                Container( 
                child: Column(
              children: List.generate(
                checkListItems.length,
                (index) => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      checkListItems[index]["title"],
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  value:checkListItems[index]["value"],
                  onChanged: (value) {
                    setState(() {
                      for (var element in checkListItems) {
                        element["value"] = false;
                      }
                      checkListItems[index]["value"] = value;
                      selected =
                          "${checkListItems[index]["title"]}";
                          print('$selected');
                    });
                  },
                ),
              ),
                ),
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> service_reportPage3(
                        
                      )
                      
                      
                      ));
                        context.read<ListTypeServiceModel>()
                        ..Installation = _Installation
                        ..Commissioning = _Commissioning
                        ..ServiceContract = _ServiceContract
                        ..Warranty = _Warranty
                        ..ServiceCall = _ServiceCall
                        ..PM = _PM
                        ..Workshop = _Workshop
                        ..Internal = _Internal
                        ..checkListItems=checkListItems;
                  },
                  
                     child: Text('next')
                     ),
                   ),
        
                ],
              )
        
            ],
          ),
        ),
   );
  }
}

class ListTypeServiceModel extends ChangeNotifier{
   late bool _Installation ;
  late bool _Commissioning ;
  late bool _ServiceContract ;
  late bool _Warranty ;
  late bool _ServiceCall ;
  late bool _PM ;
  late bool _Workshop ;
  late bool _Internal ;
  late bool _check9 ;
  late bool _check10 ;
  late bool _check11;
  List _checkListItems = [];
 List get checkListItems => this._checkListItems;

 set checkListItems(List value) { this._checkListItems = value;
 notifyListeners();
 }
  
  get Installation => this._Installation;

 set Installation( value) {
 notifyListeners(); this._Installation = value;}
 

  get Commissioning => this._Commissioning;

 set Commissioning( value) {notifyListeners(); this._Commissioning = value;}

  get ServiceContract => this._ServiceContract;

 set ServiceContract( value) {notifyListeners(); this._ServiceContract = value;}

  get Warranty => this._Warranty;

 set Warranty( value) {notifyListeners(); this._Warranty = value;}

  get ServiceCall => this._ServiceCall;

 set ServiceCall( value) {notifyListeners(); this._ServiceCall = value;}

  get PM => this._PM;

  set PM( value) {notifyListeners(); this._PM = value;}

  get Workshop => this._Workshop;

 set Workshop( value){notifyListeners(); this._Workshop = value;}

  get Internal => this._Internal;

 set Internal( value) {notifyListeners(); this._Internal = value;}


    get check9 => this._check9;

 set check9( value) {notifyListeners(); this._check9 = value;}

   get check10 => this._check10;

 set check10( value) {notifyListeners(); this._check10 = value;}

   get check11 => this._check11;

 set check11( value) {notifyListeners(); this._check11 = value;}
}
