import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

import 'package:provider/provider.dart';
import 'package:service_record/pages/Checklist_istat1/Checklist_Istat1_ConsumerModel.dart';
import 'package:service_record/pages/Checklist_istat1/Page1.dart';
import 'package:service_record/pages/CreateJob/Page1.dart';
import 'package:service_record/pages/History/history.dart';
import 'package:service_record/pages/HomePage.dart';


import 'package:service_record/pages/ListJob.dart';
import 'package:service_record/pages/Loginpage.dart';
import 'package:service_record/pages/add_device/List_Device.dart';
import 'package:service_record/pages/add_device/List_DeviceModel.dart';
import 'package:service_record/pages/add_device/List_Hospital.dart';
import 'package:service_record/pages/add_device/page1.dart';
import 'package:service_record/pages/service_report/service_reportpage1.dart';
import 'package:service_record/pages/service_report/service_reportpage2.dart';
import 'package:service_record/pages/service_report/service_reportpage3.dart';
import 'package:service_record/pages/service_report/service_reportpage4.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!'); //logout จะทำอะไรบ้าง
    } else {
      print('User is signed in!'); //login ดึง userprofile จาก firebase_auth
    }
  });
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ListTypeServiceModel()),
      ChangeNotifierProvider(create: (context) => CustomerProfileModel()),
      ChangeNotifierProvider(create: (context) => DetailRepotModel()),
      ChangeNotifierProvider(create: (context) => AddDeviceModel()),
      ChangeNotifierProvider(create: (context) => CreateJobmodel()),
      ChangeNotifierProvider(create: (context) => SparePartModel()),
      ChangeNotifierProvider(create: (context) => ProfileModel()),
      ChangeNotifierProvider(create: (context) => HospitalModel()),
      ChangeNotifierProvider(create: (context) => DevicesnameModel()),
      ChangeNotifierProvider(create: (context) => DeviceModel_Model()),
      ChangeNotifierProvider(create: (context) => CustomerDeviceData()),
      ChangeNotifierProvider(create: (context) => UserDataModel()),
      ChangeNotifierProvider(
          create: (context) => Checklist_Istat1_ConsumerModel()),
      ChangeNotifierProvider(create: (context) => Timemodel()),
      ChangeNotifierProvider(create: (context) => searchModel()),
    
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/login',
      routes: {
        //'/1': (context) => HomePage(),
        // '/0': (context) => HomePageReport(),
        '/1': (context) => service_reportpage1(),
        '/i-STAT1': (context) => Checklist_istat_Page1(),
        //'/3': (context) => AddDevice_Page1(),
        // '/4': (context) => service_reportPage3(),
        '/login': (context) => LoginPage(),
        '/homepage': (context) => HomePage(),
      },
    );
  }
}
