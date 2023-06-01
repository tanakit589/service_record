import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:service_record/pages/Loginpage.dart';
import 'package:service_record/pages/add_device/AddDataPage1.dart';
import 'package:service_record/pages/edit_data_device/edit_page1.dart';



import '../pages/History/history.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => drawerState();
}

class drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size); // สำหรับทดสอบ ดูความกว้าง สูง หน้าจอ
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
               decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
               color: Colors.pinkAccent[100],
            ),
              height: 100,
             
              child:  DrawerHeader(
                child: Center(
                    child: Consumer<ProfileModel>(
                      builder: (context, value, child) {
                    return Text(
                  '${value.username}',
                  style: TextStyle(fontSize: 18),
                    );
                    }
                    )
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: ListTile(
              title: IconButton(
                onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/homepage')),
                icon: Icon(Icons.home),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: ListTile(
              title: Center(child: const Text('Add customer device')),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddDevice_Page1()));
              },
            ),
          ),
           Container(
            decoration: BoxDecoration(
              border: Border.all()
            ),
             child: ListTile(
              title: Center(child: const Text('Edit customer device')),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditPage()));
              },
          ),
           ),
          Container(
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: ListTile(
              title: Center(child: const Text('History')),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => History()));
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: ListTile(
              title: Center(
                  child: const Text(
                'Sign out',
              )),
              onTap: () {
                ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Signed out ')));
                Navigator.popUntil(context, ModalRoute.withName('/login'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
