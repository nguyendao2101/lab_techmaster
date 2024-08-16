import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
          child: Text('Calendar', style: TextStyle(color: Colors.white))),
    );
  }
}
