import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

//import 'fifth_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tung share'),//Consumer<LoginProfileModel>(
          //builder: (context, value, child) {
            //return Text('Hello${value.firstName}');
          //},
        //),
        actions: [
          IconButton(
            icon: Icon(Icons.money),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () => Navigator.pushNamed(context,'/1'),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6,(index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context,'/${index + 1}');
            },
            child:Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.75),
                borderRadius: BorderRadius.circular(16.0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Text('Go to page ${index + 1}'),
               ],
              )
             ),
           ),
          );
        }),
      ),
    );
  }
}