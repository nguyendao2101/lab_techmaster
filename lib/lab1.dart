// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lab01 extends StatefulWidget {
  const Lab01({super.key});

  @override
  _Lab01State createState() => _Lab01State();
}

class _Lab01State extends State<Lab01> {
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  bool isMenuExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Lab01:Menu Điều Hướng Responsive (Responsive Navigation Menu)'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get the current screen height and width
          screenHeight = MediaQuery.of(context).size.height;
          screenWidth = MediaQuery.of(context).size.width;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              screenWidth <= 600
                  ? IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          isMenuExpanded = !isMenuExpanded;
                        });
                      },
                    )
                  : _mainNavigatorMenu(),
              if (isMenuExpanded) _crossNavigatorMenu(),
            ],
          );
        },
      ),
    );
  }

  Widget _mainNavigatorMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _text('Trang chủ'),
        const SizedBox(
          width: 20,
        ),
        _text('Giới thiệu'),
        const SizedBox(
          width: 20,
        ),
        _text('Dịch vụ'),
        const SizedBox(
          width: 20,
        ),
        _text('Dự án'),
        const SizedBox(
          width: 20,
        ),
        _text('Liên hệ'),
      ],
    );
  }

  Widget _crossNavigatorMenu() {
    return Column(
      children: [
        _text('Trang chủ'),
        const SizedBox(
          height: 10,
        ),
        _text('Giới thiệu'),
        const SizedBox(
          height: 10,
        ),
        _text('Dịch vụ'),
        const SizedBox(
          height: 10,
        ),
        _text('Dự án'),
        const SizedBox(
          height: 10,
        ),
        _text('Liên hệ'),
      ],
    );
  }

  Widget _text(String text) {
    return InkWell(
      onTap: () => _showSnackbar(text),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _showSnackbar(String text) {
    Get.snackbar(
      'Success',
      text,
      snackPosition: SnackPosition.TOP,
    );
  }
}
