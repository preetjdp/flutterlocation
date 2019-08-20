import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

//import 'config.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isGpsEnabled;

  Location _locationService = new Location();



  @override
  void initState() {
    super.initState();
    _locationService.onGpsButtonStateChanged().listen((e) {
      _isGpsEnabled = e;
      print("New thing from JAVA :" + e.toString());
      setState((){});
    });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Location plugin example app'),
            ),
            body: Center(
              child: Container(
                child: Text("the current status of the gpos button is  " + _isGpsEnabled.toString() )
              ),
            )));
  }
}
