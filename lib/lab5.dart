// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Widgets/calendarWidget.dart';
import 'Widgets/newWidget.dart';
import 'Widgets/todoListWidget.dart';
import 'Widgets/weatherWidget.dart';

class Lab5 extends StatefulWidget {
  const Lab5({super.key});

  @override
  _Lab5State createState() => _Lab5State();
}

class _Lab5State extends State<Lab5> {
  List<Widget> widgets = [
    // tạo danh sách các widget
    WeatherWidget(),
    NewsWidget(),
    CalendarWidget(),
    TodoListWidget(),
  ];

  @override
  void initState() {
    super.initState();
    _loadLayout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Lab 5: Bảng Điều Khiển Tuỳ Chỉnh với Chức Năng Kéo và Thả (Customizable Dashboard with Drag-and-Drop)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.restore),
            onPressed: _resetLayout,
          ),
        ],
      ),
      body: ReorderableListView(
        children: widgets.map((widget) {
          return ListTile(
            key: ValueKey(
                widget), //cho phép kéo và thả các widget. Nó hiển thị danh sách các widget, mỗi widget được bao bọc trong một ListTile với một ValueKey duy nhất.
            title: widget,
          );
        }).toList(),
        onReorder:
            _onReorder, //callback được gọi khi người dùng thay đổi thứ tự của các widget.
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    // khi người dùng thay đổi thứ tự của danh sách widget gọi saveLayout để lưu cách sắp xếp mới.
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      final Widget widget = widgets.removeAt(oldIndex);
      widgets.insert(newIndex, widget);
      _saveLayout();
    });
  }

  void _saveLayout() async {
    // lưu danh sách thay đổi vào danh sách mới
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> widgetKeys = widgets.map((w) => w.toString()).toList();
    await prefs.setStringList('widgetLayout', widgetKeys);
  }

  void _loadLayout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? widgetKeys = prefs.getStringList('widgetLayout');
    if (widgetKeys != null) {
      // Khôi phục cách sắp xếp từ Local Storage
      setState(() {
        widgets = [
          WeatherWidget(),
          NewsWidget(),
          CalendarWidget(),
          TodoListWidget(),
        ];
        // Cập nhật widgets dựa trên widgetKeys nếu cần thiết
      });
    }
  }

  void _resetLayout() {
    // đặt lại các widget thành trạng thái ban đầu
    setState(() {
      widgets = [
        WeatherWidget(),
        NewsWidget(),
        CalendarWidget(),
        TodoListWidget(),
      ];
      _saveLayout();
    });
  }
}
