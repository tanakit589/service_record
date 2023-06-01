import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:service_record/pages/CreateJob/FindErrorCodePage%201.dart';
import 'package:service_record/pages/ListJob.dart';

import 'package:service_record/pages/service_report/homepage_report.dart';
import 'package:service_record/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class JobData extends StatefulWidget {
  @override
  State<JobData> createState() => _JobDataState();
}

class _JobDataState extends State<JobData> {
  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  File _imageFile = File('.');
  Future _getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else if (pickedFile == null) {
      setState(() {
        _imageFile = File('.');
      });
    }
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Job Data '),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<CustomerDeviceData>(
                      builder: (context, value, child) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            readOnly: true,
                            initialValue: '${value.sn}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Serial Number',
                              hintText: 'Serial Number',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            readOnly: true,
                            initialValue: '${value.device_name}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Device Name',
                              hintText: 'Device Name',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                labelText: 'Hospital',
                                hintText: 'hospital',
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.location_on),
                                    onPressed: () {
                                      MapsLauncher.launchQuery(
                                          '${value.hospital}');
                                    })),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            readOnly: true,
                            initialValue: '${value.department}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Department',
                              hintText: 'Department',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            readOnly: true,
                            initialValue: '${value.error_code}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Error code',
                              hintText: 'Error code',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            readOnly: true,
                            initialValue: '${value.contact}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contact',
                              hintText: 'Contact ',
                              labelStyle: TextStyle(fontSize: 20),
                            ),
                            scrollPhysics: const BouncingScrollPhysics(),
                            onSaved: ((newValue) {
                              //    = newValue!;
                            }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            readOnly: true,
                            initialValue: '${value.contact_no}',
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Contact No.',
                                hintText: 'Contact No.',
                                labelStyle: TextStyle(fontSize: 20),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.phone),
                                  onPressed: () {
                                    _dialNumber('${value.contact_no}');
                                  },
                                )),
                            scrollPhysics: const BouncingScrollPhysics(),
                            onSaved: ((newValue) {
                              //    = newValue!;
                            }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            readOnly: true,
                            initialValue: '${value.detail}',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Detail',
                              hintText: 'Detail',
                              labelStyle: TextStyle(fontSize: 20),
                            ),
                            maxLines: 7,
                            scrollPhysics: const BouncingScrollPhysics(),
                            onSaved: ((newValue) {
                              //    = newValue!;
                            }),
                          ),
                        ),
                      ),
                      if (value.imageUrl != '') ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.network(
                              '${value.imageUrl}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ] else if (value.imageUrl == '') ...[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              height: 50,
                              width: 100,
                              decoration:
                                  BoxDecoration(border: Border.all(width: 2)),
                              child: Center(child: Text('No Image'))),
                        ),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('back')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePageReport()));
                                },
                                child: Text('Create Report')),
                          ),
                        ],
                      )
                    ]);
                  }))),
        ));
  }
}

class LatestJobData extends StatefulWidget {
  @override
  State<LatestJobData> createState() => _LatestJobDataState();
}

class _LatestJobDataState extends State<LatestJobData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Data '),
      ),
      drawer: drawer(),
    );
  }
}
