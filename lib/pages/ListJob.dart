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
import 'package:service_record/pages/History/ListJob_search.dart';
import 'package:service_record/pages/History/history.dart';
import 'package:service_record/pages/HomePage.dart';
import 'package:service_record/pages/Job_Data.dart';
import 'package:service_record/pages/Job_Data_assigned.dart';
import 'package:service_record/pages/Loginpage.dart';
import 'package:service_record/pages/History/QuotationJob.dart';
import 'package:service_record/pages/History/inprogressJob.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';

class ListJob extends StatefulWidget {
  @override
  State<ListJob> createState() => _ListJobState();
}

//พน ทำดึงข้อมูลของงานที่ มีสเตตัสแล้วในช่อง latest job

class _ListJobState extends State<ListJob> {
  Future refresh() async {
    setState(() {
      _get_job_data_info();
    });
  }

  Future refresh_latestJob() async {
    setState(() {
      _get_job_data_latest_home();
    });
  }

  String name = '';
  bool isLoading = false;
  List<AddJob_Data> job_datas = List.empty();

  List<AddJob_Data> job_datasLatest = List.empty();

  List<UserData> userdata = List.empty();
  List<AddJob_Data> job_datas_inprogress = List.empty();
  List<AddJob_Data> job_datas_quotation = List.empty();

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
    _get_job_data_info();
    _getUserData(email);
    _get_job_data_latest_home();
    _get_job_dataInprogress();
    _get_job_dataQuotation();

    // print(context.read<UserDataModel>().name);
  }

  void _get_job_dataInprogress() async {
    var newjob_data = await controller.fetch_job_data_Inprogress();
    setState(() => job_datas_inprogress = newjob_data);
    // print('${job_datas_inprogress[0].status}');
  }

  void _get_job_dataQuotation() async {
    var newjob_data = await controller.fetch_job_data_Quotation();
    setState(() => job_datas_quotation = newjob_data);
    // print('${job_datas_quotation[0].status}');
  }

  void _get_job_data_info() async {
    var newjob_data = await controller.fetch_job_data_info_service();
    setState(() {
      job_datas = newjob_data;
      job_datas.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  void _get_job_data_latest_home() async {
    var newjob_datasLatest = await controller.fetch_job_data_latest_listjob();
    setState(() {
      job_datasLatest = newjob_datasLatest;
      job_datasLatest.sort((a, b) => b.date.compareTo(a.date));
    });
    // _status = job_datasLatest[0].status;
    print(job_datasLatest[0].status);
  }

  void _getUserData(String email) async {
    var newuserdata = await controller_userdata.fetchUserData(email);
    setState(() {
      userdata = newuserdata;
      name = '${userdata[0].name}';
      context.read<UserDataModel>().name = name;
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      :Scrollbar(
          thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount: !job_datas.isEmpty ? job_datas.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!job_datas.isEmpty) {
                return ListTile(
                    onTap: () {
                      context.read<CustomerDeviceData>().date =
                          '${job_datas[index].date}';
                      context.read<CustomerDeviceData>().department =
                          '${job_datas[index].department}';
                      context.read<CustomerDeviceData>().detail =
                          '${job_datas[index].detail}';
                      context.read<CustomerDeviceData>().device_name =
                          '${job_datas[index].device_name}';
                      context.read<CustomerDeviceData>().error_code =
                          '${job_datas[index].error_code}';
                      context.read<CustomerDeviceData>().hospital =
                          '${job_datas[index].hospital}';
                      context.read<CustomerDeviceData>().sn =
                          '${job_datas[index].sn}';
                      context.read<CustomerDeviceData>().jobid =
                          '${job_datas[index].id}';
                      context.read<CustomerDeviceData>().model =
                          '${job_datas[index].model}';
                      context.read<CustomerDeviceData>().contact =
                          '${job_datas[index].contact}';
                      context.read<CustomerDeviceData>().contact_no =
                          '${job_datas[index].contact_no}';
                      context.read<CustomerDeviceData>().imageUrl =
                          '${job_datas[index].imageUrl}';
                      context.read<UserDataModel>().name = name;
      
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => JobData()));
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${job_datas[index].hospital}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                            '${job_datas[index].device_name} : ${job_datas[index].sn}'),
                        Text('date : ${job_datas[index].date.substring(0, 10)}'),
                        Text('error code ${job_datas[index].error_code}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<CustomerDeviceData>().date =
                            '${job_datas[index].date}';
                        context.read<CustomerDeviceData>().department =
                            '${job_datas[index].department}';
                        context.read<CustomerDeviceData>().detail =
                            '${job_datas[index].detail}';
                        context.read<CustomerDeviceData>().device_name =
                            '${job_datas[index].device_name}';
                        context.read<CustomerDeviceData>().error_code =
                            '${job_datas[index].error_code}';
                        context.read<CustomerDeviceData>().hospital =
                            '${job_datas[index].hospital}';
                        context.read<CustomerDeviceData>().sn =
                            '${job_datas[index].sn}';
                        context.read<CustomerDeviceData>().jobid =
                            '${job_datas[index].id}';
                        context.read<CustomerDeviceData>().model =
                            '${job_datas[index].model}';
                        context.read<CustomerDeviceData>().contact =
                            '${job_datas[index].contact}';
                        context.read<CustomerDeviceData>().contact_no =
                            '${job_datas[index].contact_no}';
                        context.read<CustomerDeviceData>().imageUrl =
                            '${job_datas[index].imageUrl}';
                        context.read<UserDataModel>().name = name;
      
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => JobData()));
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
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ],
                );
              }
            }),
      );

  Widget get latestJob => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
          thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            itemCount: !job_datasLatest.isEmpty ? job_datasLatest.length : 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemBuilder: (context, index) {
              if (!job_datasLatest.isEmpty) {
                return Container(
                  // decoration: BoxDecoration( boxShadow: [
                  //               BoxShadow(
                  //                   color: Color.fromARGB(255, 235, 161, 177),
                  //                   blurRadius: 10,
                  //                   blurStyle: BlurStyle.outer)],),
                  child: ListTile(
                      onTap: () {
                        context.read<CustomerDeviceData>().date =
                            '${job_datasLatest[index].date}';
                        context.read<CustomerDeviceData>().department =
                            '${job_datasLatest[index].department}';
                        context.read<CustomerDeviceData>().detail =
                            '${job_datasLatest[index].detail}';
                        context.read<CustomerDeviceData>().device_name =
                            '${job_datasLatest[index].device_name}';
                        context.read<CustomerDeviceData>().error_code =
                            '${job_datasLatest[index].error_code}';
                        context.read<CustomerDeviceData>().hospital =
                            '${job_datasLatest[index].hospital}';
                        context.read<CustomerDeviceData>().sn =
                            '${job_datasLatest[index].sn}';
                        context.read<CustomerDeviceData>().jobid =
                            '${job_datasLatest[index].id}';
                        context.read<CustomerDeviceData>().model =
                            '${job_datasLatest[index].model}';
                        context.read<CustomerDeviceData>().contact =
                            '${job_datasLatest[index].contact}';
                        context.read<CustomerDeviceData>().contact_no =
                            '${job_datasLatest[index].contact_no}';
                        context.read<CustomerDeviceData>().imageUrl =
                            '${job_datasLatest[index].imageUrl}';
                        context.read<UserDataModel>().name = name;
      
                        context.read<CustomerDeviceData>().status =
                            job_datasLatest[index].status;
      
                        context.read<CustomerDeviceData>().servicereport_id =
                            '${job_datasLatest[index].servicereport_id}';
      
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobData_Assign()));
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${job_datasLatest[index].hospital}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                              '${job_datasLatest[index].device_name} : ${job_datasLatest[index].sn}'),
                          Text(
                              'date : ${job_datasLatest[index].date.substring(0, 10)}'),
                          Text('error code ${job_datasLatest[index].error_code}'),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<CustomerDeviceData>().date =
                              '${job_datasLatest[index].date}';
                          context.read<CustomerDeviceData>().department =
                              '${job_datasLatest[index].department}';
                          context.read<CustomerDeviceData>().detail =
                              '${job_datasLatest[index].detail}';
                          context.read<CustomerDeviceData>().device_name =
                              '${job_datasLatest[index].device_name}';
                          context.read<CustomerDeviceData>().error_code =
                              '${job_datasLatest[index].error_code}';
                          context.read<CustomerDeviceData>().hospital =
                              '${job_datasLatest[index].hospital}';
                          context.read<CustomerDeviceData>().sn =
                              '${job_datasLatest[index].sn}';
                          context.read<CustomerDeviceData>().jobid =
                              '${job_datasLatest[index].id}';
                          context.read<CustomerDeviceData>().model =
                              '${job_datasLatest[index].model}';
                          context.read<CustomerDeviceData>().contact =
                              '${job_datasLatest[index].contact}';
                          context.read<CustomerDeviceData>().contact_no =
                              '${job_datasLatest[index].contact_no}';
                          context.read<CustomerDeviceData>().imageUrl =
                              '${job_datasLatest[index].imageUrl}';
                          context.read<UserDataModel>().name = name;
                          context.read<CustomerDeviceData>().status =
                              job_datasLatest[index].status;
                          ;
                          context.read<CustomerDeviceData>().servicereport_id =
                              '${job_datasLatest[index].servicereport_id}';
      
                          print('${job_datasLatest[index].servicereport_id}');
                          print('${job_datasLatest[index].status}');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobData_Assign()));
                        },
                        icon: Icon(Icons.description),
                      )),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('no job now',
                          style: TextStyle(
                            fontSize: 20,
                          )),
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List jobs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text('งานที่ค้างอยู่', style: TextStyle(fontSize: 20)),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InprogressJob()));
                      },
                      child: Container(
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer)
                            ],
                            border: Border.all(),
                            color: Colors.greenAccent[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('In progress',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                              Text(
                                '${job_datas_inprogress.length} Jobs',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuotationJob()));
                      },
                      child: Container(
                          height: 90,
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer)
                            ],
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 187, 181),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Waiting for\n customer\n approval ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    // color: Color.fromARGB(255, 243, 10, 10)
                                  )),
                            
                              Text(
                                '${job_datas_quotation.length} Jobs',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('New jobs',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Container(
                  height: 250,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                              color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                            blurStyle: BlurStyle.outer)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: RefreshIndicator(
                      onRefresh: refresh,
                      strokeWidth: 2,
                      color: Colors.blue,
                      child: body)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Pending jobs',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SafeArea(
                child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                               color: Color.fromARGB(255, 200, 200, 200),
                            blurRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: RefreshIndicator(
                        onRefresh: refresh_latestJob,
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

class CustomerDeviceData extends ChangeNotifier {
  String _jobid = '';
  String _date = '';
  String _sn = '';
  String _device_name = '';
  String _hospital = '';
  String _department = '';
  String _detail = '';
  String _error_code = '';
  String _model = '';
  String _contact = '';
  String _contact_no = '';
  String _imageUrl = '';
  List _status = [];
  String _servicereport_id = '';

  get status => this._status;

  set status(value) {
    this._status = value;
    notifyListeners();
  }

  get servicereport_id => this._servicereport_id;

  set servicereport_id(value) {
    this._servicereport_id = value;
    notifyListeners();
  }

  get imageUrl => this._imageUrl;

  set imageUrl(value) {
    this._imageUrl = value;
    notifyListeners();
  }

  get contact => this._contact;

  set contact(value) => this._contact = value;

  get contact_no => this._contact_no;

  set contact_no(value) => this._contact_no = value;

  get model => this._model;

  set model(value) {
    this._model = value;
    notifyListeners();
  }

  get jobid => this._jobid;

  set jobid(value) {
    this._jobid = value;
    notifyListeners();
  }

  get date => this._date;

  set date(value) {
    this._date = value;
    notifyListeners();
  }

  get sn => this._sn;

  set sn(value) {
    this._sn = value;
    notifyListeners();
  }

  get device_name => this._device_name;

  set device_name(value) {
    this._device_name = value;
    notifyListeners();
  }

  get hospital => this._hospital;

  set hospital(value) {
    this._hospital = value;
    notifyListeners();
  }

  get department => this._department;

  set department(value) {
    this._department = value;
  }

  get detail => this._detail;

  set detail(value) {
    this._detail = value;
    notifyListeners();
  }

  get error_code => this._error_code;

  set error_code(value) {
    this._error_code = value;
    notifyListeners();
  }
}
