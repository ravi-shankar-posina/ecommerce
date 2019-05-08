import 'package:flutter/material.dart';


class Page extends StatelessWidget {

  final String title;

  Page(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title:const Text('Taaza', style: TextStyle(color: Colors.black)), backgroundColor: Colors.lightGreen, iconTheme: IconThemeData(color: Colors.black),),
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}