import 'package:flutter/material.dart';
import 'package:lab1/Widgets/images_extention.dart';
import 'package:lab1/Widgets/lab3FullImages.dart';

class Lab3 extends StatelessWidget {
  final List<String> imageUrls = [
    ImageAssest.pic1,
    ImageAssest.pic2,
    ImageAssest.pic3,
  ];

  Lab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Lab 3: Thư Viện Hình Ảnh Tương Tác (Interactive Image Gallery)'),
      ),
      body: GridView.builder(
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImage(
                    imageUrls: imageUrls,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Image.asset(
              imageUrls[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
