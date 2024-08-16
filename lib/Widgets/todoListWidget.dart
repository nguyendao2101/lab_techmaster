import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
          child: Text('To-Do List', style: TextStyle(color: Colors.white))),
    );
  }
}
