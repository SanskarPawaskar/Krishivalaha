import 'package:flutter/material.dart';

class Header {
  // Creating a Field/Property
  dynamic geekName;
  Header(geekName1){geekName=geekName1;}
  
  dynamic get getAppbar{
    final appBar = AppBar(
    centerTitle:true,
    title: Text(geekName),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.comment),
        tooltip: 'Comment Icon',
        onPressed: () {},
      ), //IconButton
      IconButton(
        icon: const Icon(Icons.settings),
        tooltip: 'Setting Icon',
        onPressed: () {},
      ), //IconButton
    ], //<Widget>[]
    backgroundColor: Colors.green.shade900,
    elevation: 50.0,
  );
  return appBar;

  }
}


  