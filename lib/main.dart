import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab1/lab1.dart';
import 'package:lab1/lab2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'lab',
      // home: Lab01(),
      home: Lab2(),
    );
  }
}
