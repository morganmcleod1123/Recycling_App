import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'main.dart';
//https://www.youtube.com/watch?v=2pFyy-ARuhw&ab_channel=MaiDev
class LocationPage extends StatefulWidget{
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage>{
  Position _position;
  StreamSubscription <Position> _positionStream;
  var _materials = ["Paper", "Plastic", "Glass", "Cardboard"];
  @override
  void initState(){
    super.initState();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _positionStream = Geolocator().getPositionStream(locationOptions).listen((Position position) {
      setState(() {
        print(position);
        _position = position;
      });
    });
  }
  @override
  void dispose(){
    super.dispose();
    _positionStream.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Location Manager"),
    ),

      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text("Testing", style: Theme.of(context).textTheme.headline4)
              )

            ],
          )

      ),);
  }

  String locationFunction(){
    return ("Location ${_position?.latitude?? '-'}, ${_position?.longitude?? '-'}");
  }

}
