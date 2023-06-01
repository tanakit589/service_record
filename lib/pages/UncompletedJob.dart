import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:service_record/Controller/Job_Data_controller.dart';
import 'package:service_record/Model/Job_Data_model.dart';
import 'package:service_record/Model/User_Data_model.dart';
import 'package:service_record/Service/Job_Data_service.dart';
import 'package:service_record/Service/User_Data_service.dart';
import 'package:service_record/pages/CreateJob/FindErrorCodePage%201.dart';
import 'package:service_record/pages/HomePage.dart';
import 'package:service_record/pages/ListJob.dart';

import 'package:service_record/pages/Job_Data.dart';
import 'package:service_record/pages/Job_Data_assigned.dart';
import 'package:service_record/pages/Loginpage.dart';

import 'package:service_record/pages/service_report/homepage_report.dart';
import 'package:service_record/pages/service_report/service_reportpage1.dart';

import 'package:service_record/widgets/drawer.dart';
import 'package:provider/provider.dart';

class UncompletedJob extends StatefulWidget {
  @override
  State<UncompletedJob> createState() => _UncompletedJobState();
}

//พน ทำดึงข้อมูลของงานที่ มีสเตตัสแล้วในช่อง latest job

class _UncompletedJobState extends State<UncompletedJob> {
  Future refresh() async {
    setState(() {
      _get_job_data_uncompleted();
    });
  }

  
  bool isLoading = false;
  List<AddJob_Data> job_datas_uncompleted = List.empty();

  Job_Data_Controller controller = Job_Data_Controller(AddJob_DataService());

  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
   
    _get_job_data_uncompleted();
  }

 void _get_job_data_uncompleted() async {
    var newjob_datasLatest = await controller.fetch_job_data_latest_listjob();
    setState(() { 
      job_datas_uncompleted = newjob_datasLatest;
 job_datas_uncompleted.sort((a, b) => b.date.compareTo(a.date));    
 });
  }
  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.separated(
          itemCount:
              !job_datas_uncompleted.isEmpty ? job_datas_uncompleted.length : 1,
          separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Color.fromARGB(255, 125, 125, 125),
                thickness: 2,
              ),
          itemBuilder: (context, index) {
            if (!job_datas_uncompleted.isEmpty) {
              return ListTile(
                  onTap: () {
                    context.read<CustomerDeviceData>().date =
                        '${job_datas_uncompleted[index].date}';
                    context.read<CustomerDeviceData>().department =
                        '${job_datas_uncompleted[index].department}';
                    context.read<CustomerDeviceData>().detail =
                        '${job_datas_uncompleted[index].detail}';
                    context.read<CustomerDeviceData>().device_name =
                        '${job_datas_uncompleted[index].device_name}';
                    context.read<CustomerDeviceData>().error_code =
                        '${job_datas_uncompleted[index].error_code}';
                    context.read<CustomerDeviceData>().hospital =
                        '${job_datas_uncompleted[index].hospital}';
                    context.read<CustomerDeviceData>().sn =
                        '${job_datas_uncompleted[index].sn}';
                    context.read<CustomerDeviceData>().jobid =
                        '${job_datas_uncompleted[index].id}';
                    context.read<CustomerDeviceData>().model =
                        '${job_datas_uncompleted[index].model}';
                    context.read<CustomerDeviceData>().contact =
                        '${job_datas_uncompleted[index].contact}';
                    context.read<CustomerDeviceData>().contact_no =
                        '${job_datas_uncompleted[index].contact_no}';
                    context.read<CustomerDeviceData>().imageUrl =
                        '${job_datas_uncompleted[index].imageUrl}';
                  
                    context.read<CustomerDeviceData>().status =
                        job_datas_uncompleted[index].status;
                    context.read<CustomerDeviceData>().servicereport_id =
                        '${job_datas_uncompleted[index].servicereport_id}';

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobData_Assign()));
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${job_datas_uncompleted[index].hospital}',
                       style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      Text(
                          '${job_datas_uncompleted[index].device_name} : ${job_datas_uncompleted[index].sn}'),
                      Text(
                          'date : ${job_datas_uncompleted[index].date.substring(0, 10)}'),
                      Text(
                          'error code ${job_datas_uncompleted[index].error_code}'),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                         context.read<CustomerDeviceData>().date =
                        '${job_datas_uncompleted[index].date}';
                    context.read<CustomerDeviceData>().department =
                        '${job_datas_uncompleted[index].department}';
                    context.read<CustomerDeviceData>().detail =
                        '${job_datas_uncompleted[index].detail}';
                    context.read<CustomerDeviceData>().device_name =
                        '${job_datas_uncompleted[index].device_name}';
                    context.read<CustomerDeviceData>().error_code =
                        '${job_datas_uncompleted[index].error_code}';
                    context.read<CustomerDeviceData>().hospital =
                        '${job_datas_uncompleted[index].hospital}';
                    context.read<CustomerDeviceData>().sn =
                        '${job_datas_uncompleted[index].sn}';
                    context.read<CustomerDeviceData>().jobid =
                        '${job_datas_uncompleted[index].id}';
                    context.read<CustomerDeviceData>().model =
                        '${job_datas_uncompleted[index].model}';
                    context.read<CustomerDeviceData>().contact =
                        '${job_datas_uncompleted[index].contact}';
                    context.read<CustomerDeviceData>().contact_no =
                        '${job_datas_uncompleted[index].contact_no}';
                    context.read<CustomerDeviceData>().imageUrl =
                        '${job_datas_uncompleted[index].imageUrl}';
                  
                    context.read<CustomerDeviceData>().status =
                        job_datas_uncompleted[index].status;
                    context.read<CustomerDeviceData>().servicereport_id =
                        '${job_datas_uncompleted[index].servicereport_id}';

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
                        style: TextStyle(
                         
                          fontSize: 20,
                        )),
                  ),
                ],
              );
            }
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uncompleted Job',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '${job_datas_uncompleted.length} Jobs',
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
        actions: [
        
          GestureDetector(
              child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            iconSize: 30,
          )),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            Divider(
              color: Colors.white,
              height: 10,
            ),
            Container(
                height: 500,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 48, 48, 48),
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: RefreshIndicator(
                    onRefresh: refresh,
                    strokeWidth: 2,
                    color: Colors.blue,
                    child: body)),
          ]),
        ),
      ),
    );
  }
}
