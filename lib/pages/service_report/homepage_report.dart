import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:provider/provider.dart';
import 'package:service_record/pages/CreateJob/FindErrorCodePage%201.dart';
import 'package:service_record/pages/ListJob.dart';

import 'package:service_record/widgets/drawer.dart';

class HomePageReport extends StatefulWidget {
  HomePageReport({Key? key}) : super(key: key);

  @override
  State<HomePageReport> createState() => _HomePageReportState();
}

class _HomePageReportState extends State<HomePageReport> {
  @override
  int a = 10;
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size); // สำหรับทดสอบ ดูความกว้าง สูง หน้าจอ
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text('Select report'),
      ),
      body: Consumer<CustomerDeviceData>(
                      builder: (context, value, child) {
                    return Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 80,
            childAspectRatio: 0.8,
            children: List.generate(2, (index) {
              return InkWell(
                onTap: () {
                  if(index== 0){
                  Navigator.pushNamed(context, '/1');
                  }
                  if(index== 1){
                  Navigator.pushNamed(context, '/${value.model}');
                  }
                },
                child: Column(
                  children: [
                    if(index== 0)...[
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 255, 255, 255).withAlpha(100),
                            border: Border.all(
                                color: Color.fromARGB(255, 0, 0, 0),
                                width: 1.0)),
                        child: Center(child: Image.asset('images/image1.jpg')),
                      ),
                    ),
                    ]
                    else if(index== 1)...[
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 255, 255, 255).withAlpha(100),
                            border: Border.all(
                                color: Color.fromARGB(255, 0, 0, 0),
                                width: 1.0)),
                        child: Center(child: Image.asset('images/${value.model}.jpg')),
                      ),
                    ),
                    ],
                    if (index == 0) ...[
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 4.0,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 22, 236, 47)
                                      .withAlpha(100),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 1.0)),
                              child: Center(child: Text('Service_report'))),
                        ),
                      )
                    ] else if (index == 1) ...[
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 4.0,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 22, 236, 47)
                                      .withAlpha(100),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 1.0)),
                              child: Center(child: Text('Checklist ${value.model}'))),
                        ),
                      )
                    ]
                  ],
                ),
              );
            }),
          ),
        ),
      );
                      }
      )    
    );
  }
  }

