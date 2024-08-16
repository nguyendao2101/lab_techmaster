import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child:
          Center(child: Text('Weather', style: TextStyle(color: Colors.white))),
    );
  }
}
