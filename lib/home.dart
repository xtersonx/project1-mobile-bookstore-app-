
import 'package:bkv2/sport.dart';

import 'culture.dart';
import 'package:flutter/material.dart';
import 'currency.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Category'),
        actions: [
          IconButton(
            icon: Icon(Icons.monetization_on),
            color: Colors.white,
            onPressed: () {
              // Navigate to another page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Currency(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Text("choose a Category",style: TextStyle(fontSize: 40,color: Colors.white,fontStyle: FontStyle.italic),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Culture(),
              ));
            }, child: Container(
              child: GestureDetector(
                child: Image.asset('images/culture.jpg', height: 150, width: screenWidth, fit: BoxFit.cover,),
              ),
              color: Colors.green,
            ),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Sport(),
              ));
            }, child: Container(
              child: GestureDetector(
                child: Image.asset('images/sportimage.jpg', height: 150, width: screenWidth, fit: BoxFit.cover,),
              ),
              color: Colors.green,
            ),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () {
            }, child: Container(
              child: GestureDetector(
                child: Image.asset('images/comingsoon.jpg', height: 150, width: screenWidth, fit: BoxFit.cover,),
              ),
              color: Colors.green,
            ),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () {
            }, child: Container(
              child: GestureDetector(
                child: Image.asset('images/comingsoon.jpg', height: 150, width: screenWidth, fit: BoxFit.cover,),
              ),
              color: Colors.green,
            ),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () {
            }, child: Container(
              child: GestureDetector(
                child: Image.asset('images/comingsoon.jpg', height: 150, width: screenWidth, fit: BoxFit.cover,),
              ),
              color: Colors.green,
            ),),
          ],
        ),
      ),
    );
  }
}
