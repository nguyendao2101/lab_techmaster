import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab1/lab1.dart';
import 'package:lab1/lab2.dart';
import 'package:lab1/lab3.dart';
import 'package:lab1/lab4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'lab',
      // home: Lab01(),
      // home: Lab2(),
      // home: Lab3(),
      home: Lab4(),
    );
  }
}
