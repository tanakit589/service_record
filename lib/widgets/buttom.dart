import 'package:flutter/material.dart';

class counterButton extends StatefulWidget{
  @override
  State<counterButton> createState() => _counterButtonState();
}

class _counterButtonState extends State<counterButton> {
  int _counter = 0 ;
  @override
  Widget build (Object context){
    return ElevatedButton(
      onPressed: () {
        setState(() { //เป็นการสั่งให้รีเฟรช ทุกครั้งที่มีการกด
          _counter = _counter + 1;
        });
      } , child:Text('counter press : $_counter'), //$ นำหน้าคือให้ไปเอาค่ามาจากตัวแปร
      );
  }
}