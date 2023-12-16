import 'package:flutter/material.dart';
class Showdetails extends StatelessWidget {
  const Showdetails({super.key});
  @override
  Widget build(BuildContext context) {
    String m=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Book Details')),
      body: Center(
        child: Container(
          child: Center(
            child: Text(m,style:  TextStyle(color: Colors.blue,fontSize: 35),),
          ),
          width: 460,
        ),
      ),
    );
  }
}