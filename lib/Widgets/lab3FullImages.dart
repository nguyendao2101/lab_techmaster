// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  final List<String> imageUrls; // lấy hình ảnh
  final int initialIndex; // vị trí hình ảnh hiện tại khi ấn vào

  const FullScreenImage(
      {super.key, required this.imageUrls, required this.initialIndex});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late int currentIndex; //lưu vị trí hình ảnh đang hiển thị
  late PageController _pageController; // quản lý việc điều khiển pageView

  @override
  void initState() {
    super.initState();
    currentIndex = widget
        .initialIndex; // thiết lập hình ảnh đầu tiên hiển thị được truyền từ phía lab03 khi ấn vào hình ảnh
    _pageController =
        PageController(initialPage: currentIndex); // hiển thị ảnh ban đầu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            //điều hướng hình ảnh
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex =
                    index; // cập nhật giá trị currentIndex để hiển thị ảnh sau khi thay đổi
              });
            },
            itemBuilder: (context, index) {
              return AnimatedOpacity(
                // hiệu ứng mờ dần
                opacity: currentIndex == index ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          if (currentIndex >
              0) // kiểm tra hình ảnh hiện tại có phải là hình ảnh đầu và cuối không
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  _pageController.previousPage(
                    //Khi nút "back" được bấm, nó sẽ cuộn về trang trước với hiệu ứng chuyển đổi.
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          if (currentIndex <
              widget.imageUrls.length -
                  1) // kiểm tra hình ảnh hiện tại có phải là hình ảnh đầu và cuối không
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: () {
                  _pageController.nextPage(
                    //Khi nút "next" được bấm, nó sẽ cuộn về trang trước với hiệu ứng chuyển đổi.
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
