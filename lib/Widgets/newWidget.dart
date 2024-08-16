import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text('News', style: TextStyle(color: Colors.white))),
    );
  }
}
