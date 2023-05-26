import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';
import 'package:service_record/Controller/User_Data_controller.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Model/User_Data_model.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/Service/User_Data_service.dart';
import 'package:service_record/pages/CreateJob/Page1.dart';
import 'package:service_record/pages/History/ListJob_search.dart';
import 'package:service_record/pages/History/history.dart';

import 'package:service_record/pages/ListJob.dart';

import 'package:service_record/pages/Loginpage.dart';

import 'package:service_record/pages/NewJob.dart';
import 'package:service_record/pages/UncompletedJob.dart';
import 'package:service_record/pages/add_device/page1.dart';
import 'package:service_record/pages/edit_data_device/edit_page1.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

//พน ทำดึงข้อมูลของงานที่ มีสเตตัสแล้วในช่อง latest job

class _HomePageState extends State<HomePage> {
  Future refresh_Job() async {
    setState(() {
      _get_job_data_uncompleted();
      _get_job_data();
      Navigator.pop(context);
    });
  }

  String name = '';
  bool isLoading = false;

  List<AddJob_Data> job_datas = List.empty();
  List<AddJob_Data> job_datas_uncompleted = List.empty();

  List<UserData> userdata = List.empty();

  Job_Data_Controller controller = Job_Data_Controller(AddJob_DataService());
  UserDataController controller_userdata =
      UserDataController(UserDataService());
  List _status = [];
  
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    String email = context.read<ProfileModel>().username;

    _getUserData(email);
    _get_job_data();
    _get_job_data_uncompleted();

    // print(context.read<UserDataModel>().name);
  }

  void _get_job_data() async {
    var newjob_datasLatest = await controller.fetch_job_data_info_service();
    setState(() => job_datas = newjob_datasLatest);
  }

  void _get_job_data_uncompleted() async {
    var newjob_datasLatest = await controller.fetch_job_data_latest_listjob();
    setState(() => job_datas_uncompleted = newjob_datasLatest);
  }

  void _getUserData(String email) async {
    var newuserdata = await controller_userdata.fetchUserData(email);
    setState(() {
      userdata = newuserdata;
      name = '${userdata[0].name}';
      context.read<UserDataModel>().name = name;
    });
  }

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
                    Navigator.pop(context);
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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, ${name}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
          actions: [
          
            GestureDetector(
                child: IconButton(
              onPressed: () {
             
                _get_job_data_uncompleted();
                _get_job_data();
              },
              icon: Icon(Icons.refresh),
              iconSize: 30,
            )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RefreshIndicator(
                onRefresh: refresh_Job,
                strokeWidth: 2,
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewJob()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 196, 0),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 255, 255, 255),
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer),
                        ],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Text('New Jobs   ${job_datas.length} Jobs',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UncompletedJob()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 152, 150, 150),
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer),
                        ],
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: Text(
                                'Pending jobs   ${job_datas_uncompleted.length} Jobs',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const ShapeDecoration(
                              color: Color.fromARGB(255, 255, 96, 199),
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.list_alt),
                              color: Color.fromARGB(255, 236, 235, 235),
                              iconSize: 50,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListJob()));
                              },
                            ),
                          ),
                          Text(
                            'List jobs',
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 8, right: 8),
                            child: Container(
                              decoration: const ShapeDecoration(
                                color: Color.fromARGB(255, 255, 96, 199),
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.add_box),
                                color: Color.fromARGB(255, 236, 235, 235),
                                iconSize: 50,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddDevice_Page1()));
                                },
                              ),
                            ),
                          ),
                          Text(
                            'Add Cust.\n  device',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: const ShapeDecoration(
                                color: Color.fromARGB(255, 255, 96, 199),
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                color: Color.fromARGB(255, 236, 235, 235),
                                onPressed: () {
                                  _searchdialog(context);
                                },
                                icon: Icon(Icons.search),
                                iconSize: 50,
                              )),
                          Text(
                            'Search job',
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 8, right: 8),
                            child: Container(
                              decoration: const ShapeDecoration(
                                color: Color.fromARGB(255, 255, 96, 199),
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.edit_outlined),
                                color: Color.fromARGB(255, 236, 235, 235),
                                iconSize: 50,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditPage()));
                                },
                              ),
                            ),
                          ),
                          Text(
                            'Edit Cust.\n  device',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const ShapeDecoration(
                              color: Color.fromARGB(255, 255, 96, 199),
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              color: Color.fromARGB(255, 236, 235, 235),
                              icon: Icon(Icons.build),
                              iconSize: 50,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateJobPage1()));
                              },
                            ),
                          ),
                          Text(
                            ' Find error',
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 8, right: 8),
                            child: Container(
                              decoration: const ShapeDecoration(
                                color: Color.fromARGB(255, 255, 96, 199),
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                color: Color.fromARGB(255, 236, 235, 235),
                                icon: Icon(Icons.history),
                                iconSize: 50,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => History()));
                                },
                              ),
                            ),
                          ),
                          Text(
                            'History\n ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class UserDataModel extends ChangeNotifier {
  String _name = '';
  get name => this._name;

  set name(value) => this._name = value;
}
