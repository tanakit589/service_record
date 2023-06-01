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

class NewJob extends StatefulWidget {
  @override
  State<NewJob> createState() => _NewJobState();
}

//พน ทำดึงข้อมูลของงานที่ มีสเตตัสแล้วในช่อง latest job

class _NewJobState extends State<NewJob> {
  Future refresh() async {
    setState(() {
      _get_new_job_data();
    });
  }

  bool isLoading = false;
  List<AddJob_Data> new_job = List.empty();

  Job_Data_Controller controller = Job_Data_Controller(AddJob_DataService());

  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));

    _get_new_job_data();
  }

  void _get_new_job_data() async {
    var newjob_data = await controller.fetch_job_data_info_service();
    setState(() {
      new_job = newjob_data;
      new_job.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.separated(
          itemCount: !new_job.isEmpty ? new_job.length : 1,
          separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Color.fromARGB(255, 125, 125, 125),
                thickness: 2,
              ),
          itemBuilder: (context, index) {
            if (!new_job.isEmpty) {
              return ListTile(
                  onTap: () {
                    context.read<CustomerDeviceData>().date =
                        '${new_job[index].date}';
                    context.read<CustomerDeviceData>().department =
                        '${new_job[index].department}';
                    context.read<CustomerDeviceData>().detail =
                        '${new_job[index].detail}';
                    context.read<CustomerDeviceData>().device_name =
                        '${new_job[index].device_name}';
                    context.read<CustomerDeviceData>().error_code =
                        '${new_job[index].error_code}';
                    context.read<CustomerDeviceData>().hospital =
                        '${new_job[index].hospital}';
                    context.read<CustomerDeviceData>().sn =
                        '${new_job[index].sn}';
                    context.read<CustomerDeviceData>().jobid =
                        '${new_job[index].id}';
                    context.read<CustomerDeviceData>().model =
                        '${new_job[index].model}';
                    context.read<CustomerDeviceData>().contact =
                        '${new_job[index].contact}';
                    context.read<CustomerDeviceData>().contact_no =
                        '${new_job[index].contact_no}';
                    context.read<CustomerDeviceData>().imageUrl =
                        '${new_job[index].imageUrl}';

                    // context.read<CustomerDeviceData>().status =
                    //     new_job[index].status;
                    context.read<CustomerDeviceData>().servicereport_id =
                        '${new_job[index].servicereport_id}';

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => JobData()));
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${new_job[index].hospital}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                          '${new_job[index].device_name} : ${new_job[index].sn}'),
                      Text('date : ${new_job[index].date.substring(0, 10)}'),
                      Text('error code ${new_job[index].error_code}'),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<CustomerDeviceData>().date =
                          '${new_job[index].date}';
                      context.read<CustomerDeviceData>().department =
                          '${new_job[index].department}';
                      context.read<CustomerDeviceData>().detail =
                          '${new_job[index].detail}';
                      context.read<CustomerDeviceData>().device_name =
                          '${new_job[index].device_name}';
                      context.read<CustomerDeviceData>().error_code =
                          '${new_job[index].error_code}';
                      context.read<CustomerDeviceData>().hospital =
                          '${new_job[index].hospital}';
                      context.read<CustomerDeviceData>().sn =
                          '${new_job[index].sn}';
                      context.read<CustomerDeviceData>().jobid =
                          '${new_job[index].id}';
                      context.read<CustomerDeviceData>().model =
                          '${new_job[index].model}';
                      context.read<CustomerDeviceData>().contact =
                          '${new_job[index].contact}';
                      context.read<CustomerDeviceData>().contact_no =
                          '${new_job[index].contact_no}';
                      context.read<CustomerDeviceData>().imageUrl =
                          '${new_job[index].imageUrl}';

                      // context.read<CustomerDeviceData>().status =
                      //     new_job[index].status;
                      context.read<CustomerDeviceData>().servicereport_id =
                          '${new_job[index].servicereport_id}';

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
              'New Jobs',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '${new_job.length} Jobs',
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
