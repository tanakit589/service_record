import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';

import 'package:service_record/Model/Job_Data_model.dart';

import 'package:service_record/Service/Job_Data_service.dart';

import 'package:service_record/pages/History/CompletedJob.dart';
import 'package:service_record/pages/History/ListJob_search.dart';
import 'package:service_record/pages/History/QuotationJob.dart';
import 'package:service_record/pages/History/inprogressJob.dart';
import 'package:service_record/pages/HomePage.dart';
import 'package:service_record/pages/ListJob.dart';
import 'package:service_record/pages/Job_Data_assigned.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Job_Data_Controller controller_jobs =
      Job_Data_Controller(AddJob_DataService());
  Job_Data_Controller controller_jobsLatest =
      Job_Data_Controller(AddJob_DataService());

  List<AddJob_Data> job_dataslatest = List.empty();
  List<AddJob_Data> job_datas_completed = List.empty();
  List<AddJob_Data> job_datas_quotation = List.empty();
  List<AddJob_Data> job_datas_inprogress = List.empty();

  String name = '';

  Future refreshLatest() async {
    setState(() {
      _get_job_data_latest();
      _get_job_data_Completed();
      _get_job_data_Quotation();
      _get_job_data_Inprogress();
    });
  }

  bool isLoading = false;

  void initState() {
    super.initState();
    controller_jobs.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    name = context.read<UserDataModel>().name;
    // print(name);

    _get_job_data_latest();
    _get_job_data_Completed();
    _get_job_data_Quotation();
    _get_job_data_Inprogress();
  }

  void _get_job_data_latest() async {
    var newjob_data = await controller_jobsLatest.fetch_job_data_latest();
    setState(() {
      job_dataslatest = newjob_data;
      job_dataslatest.sort((a, b) => b.date.compareTo(a.date));    

    });
  }

  void _get_job_data_Completed() async {
    var newjob_data = await controller_jobs.fetch_job_data_Completed();
    setState(() {
      job_datas_completed = newjob_data;
     
    });
  }

  void _get_job_data_Quotation() async {
    var newjob_data = await controller_jobs.fetch_job_data_Quotation();
    setState(() {
      job_datas_quotation = newjob_data;
    });
  }

  void _get_job_data_Inprogress() async {
    var newjob_data = await controller_jobs.fetch_job_data_Inprogress();
    setState(() {
      job_datas_inprogress = newjob_data;
      
    });
  }

  Widget get latestJob => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
          thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount: !job_dataslatest.isEmpty ? job_dataslatest.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                 thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!job_dataslatest.isEmpty) {
                return ListTile(
                    onTap: () {
                      context.read<CustomerDeviceData>().date =
                          '${job_dataslatest[index].date}';
                      context.read<CustomerDeviceData>().department =
                          '${job_dataslatest[index].department}';
                      context.read<CustomerDeviceData>().detail =
                          '${job_dataslatest[index].detail}';
                      context.read<CustomerDeviceData>().device_name =
                          '${job_dataslatest[index].device_name}';
                      context.read<CustomerDeviceData>().error_code =
                          '${job_dataslatest[index].error_code}';
                      context.read<CustomerDeviceData>().hospital =
                          '${job_dataslatest[index].hospital}';
                      context.read<CustomerDeviceData>().sn =
                          '${job_dataslatest[index].sn}';
                      context.read<CustomerDeviceData>().jobid =
                          '${job_dataslatest[index].id}';
                      context.read<CustomerDeviceData>().model =
                          '${job_dataslatest[index].model}';
                      context.read<CustomerDeviceData>().contact =
                          '${job_dataslatest[index].contact}';
                      context.read<CustomerDeviceData>().contact_no =
                          '${job_dataslatest[index].contact_no}';
                      context.read<CustomerDeviceData>().imageUrl =
                          '${job_dataslatest[index].imageUrl}';
                      context.read<UserDataModel>().name = name;
                      context.read<CustomerDeviceData>().status =
                          job_dataslatest[index].status;
                      context.read<CustomerDeviceData>().servicereport_id =
                          '${job_dataslatest[index].servicereport_id}';
      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobData_Assign()));
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${job_dataslatest[index].hospital}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${job_dataslatest[index].device_name} :${job_dataslatest[index].sn}'),
                        Text(
                            'date : ${job_dataslatest[index].date.substring(0, 10)}'),
                        Text('error code ${job_dataslatest[index].error_code}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<CustomerDeviceData>().date =
                            '${job_dataslatest[index].date}';
                        context.read<CustomerDeviceData>().department =
                            '${job_dataslatest[index].department}';
                        context.read<CustomerDeviceData>().detail =
                            '${job_dataslatest[index].detail}';
                        context.read<CustomerDeviceData>().device_name =
                            '${job_dataslatest[index].device_name}';
                        context.read<CustomerDeviceData>().error_code =
                            '${job_dataslatest[index].error_code}';
                        context.read<CustomerDeviceData>().hospital =
                            '${job_dataslatest[index].hospital}';
                        context.read<CustomerDeviceData>().sn =
                            '${job_dataslatest[index].sn}';
                        context.read<CustomerDeviceData>().jobid =
                            '${job_dataslatest[index].id}';
                        context.read<CustomerDeviceData>().model =
                            '${job_dataslatest[index].model}';
                        context.read<CustomerDeviceData>().contact =
                            '${job_dataslatest[index].contact}';
                        context.read<CustomerDeviceData>().contact_no =
                            '${job_dataslatest[index].contact_no}';
                        context.read<CustomerDeviceData>().imageUrl =
                            '${job_dataslatest[index].imageUrl}';
                        context.read<UserDataModel>().name = name;
                        context.read<CustomerDeviceData>().status =
                            job_dataslatest[index].status;
                        context.read<CustomerDeviceData>().servicereport_id =
                            '${job_dataslatest[index].servicereport_id}';
      
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobData_Assign()));
                      },
                      icon: Icon(Icons.description),
                    ));
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('No job now',
                      style: TextStyle(fontSize: 20),),
                    ),
                  ],
                );
              }
            }),
      );

  Future<void> _searchdialog(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    String _sn = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formkey,
          child: AlertDialog(
            title: Text('Find Job'),
            content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text('Please fill Serial number'),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Serial number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter serial number';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      _sn = newValue!;
                    }),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text(
                  'cancel',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text(
                  'Find',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    context.read<searchModel>().searchSN = _sn;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListJobSearch()));
                    print(_sn);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
         
          GestureDetector(
              child: IconButton(
            onPressed: () {
              _searchdialog(context);
            },
            icon: Icon(Icons.search),
            iconSize: 30,
          )),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompletedJob()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 152, 150, 150),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer)
                            ],  borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Completed',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 25, 176, 5))),
                                Text('${job_datas_completed.length} Jobs')
                              ],
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InprogressJob()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 152, 150, 150),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer),
                            ],
                             borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('In Progress',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 145, 130, 3))),
                                Text('${job_datas_inprogress.length} Jobs')
                              ],
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuotationJob()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 152, 150, 150),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer),
                            ],
                             borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Waiting for ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                                Text('customer',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                                Text('approval',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                                Text('${job_datas_quotation.length} Jobs'),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('List Jobs', style: TextStyle(fontSize: 20)),
              ),
              SafeArea(
                child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                             color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                              blurStyle: BlurStyle.outer),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 78, 77, 77), width: 1)),
                    child: RefreshIndicator(
                        onRefresh: refreshLatest,
                        strokeWidth: 2,
                        color: Colors.blue,
                        child: latestJob)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class searchModel extends ChangeNotifier {
  String _searchSN = '';
  get searchSN => this._searchSN;

  set searchSN(value) {
    this._searchSN = value;
    notifyListeners();
  }
}
