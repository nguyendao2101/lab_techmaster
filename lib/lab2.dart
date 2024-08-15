import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Lab2 extends StatefulWidget {
  const Lab2({super.key});

  @override
  State<Lab2> createState() => _Lab2State();
}

class _Lab2State extends State<Lab2> {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  String? hoTen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Lab 2: Xác Thực Biểu Mẫu Động Căn bản (Dynamic Form Validation)'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Họ và tên',
                      filled: true,
                      fillColor: Colors.grey,
                    ),
                    style: const TextStyle(color: Colors.white70),
                    onChanged: onChangeCheckName,
                    validator: validartorCheckName,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.grey,
                    ),
                    style: const TextStyle(color: Colors.white70),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: onChangeUsername,
                    validator: validatorUsername,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey,
                    ),
                    style: const TextStyle(color: Colors.white70),
                    onChanged: onChangePassword,
                    validator: validatorPassword,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nhập lại Password',
                      filled: true,
                      fillColor: Colors.grey,
                    ),
                    style: const TextStyle(color: Colors.white70),
                    onChanged: onChangeConfirmPassword,
                    validator: validatorConfirmPassword,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      _showSnackbar('Đăng nhập thành công');
                    } else {
                      _showSnackbar(
                          'Đăng nhập thất bại, vui lòng kiểm tra lại thông tin');
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onChangeUsername(String valueEmail) {
    email = valueEmail;
    formKey.currentState?.validate();
  }

  void onChangePassword(String valuePassword) {
    password = valuePassword;
    formKey.currentState?.validate();
  }

  void onChangeConfirmPassword(String valueconfirmPassword) {
    confirmPassword = valueconfirmPassword;
    formKey.currentState?.validate();
  }

  void onChangeCheckName(String valuehoTen) {
    hoTen = valuehoTen;
    formKey.currentState?.validate();
  }

  bool containsSpecialCharacters(String text) {
    final allowedSpecialCharacters = RegExp(r'[@]');
    return allowedSpecialCharacters.hasMatch(text);
  }

  bool containsUppercaseLetter(String text) {
    return RegExp(r'[A-Z]').hasMatch(text);
  }

  bool containsLowercaseLetter(String text) {
    return RegExp(r'[a-z]').hasMatch(text);
  }

  bool containsDigit(String text) {
    return RegExp(r'\d').hasMatch(text);
  }

  String? validatorUsername(String? email) {
    if ((email ?? '').isEmpty) {
      return 'Bắt buộc';
    } else if (!containsSpecialCharacters(email!)) {
      return 'Email cần đúng định dạng';
    } else {
      return null;
    }
  }

  String? validatorPassword(String? value) {
    if ((value ?? '').isEmpty) {
      return 'Bắt buộc';
    } else if ((value ?? '').length < 8) {
      return 'Password không được nhỏ hơn 8 ký tự';
    } else if (value!.contains(' ')) {
      return 'Password không được chứa khoảng trắng';
    } else if (!containsUppercaseLetter(value)) {
      return 'Password cần chứa ít nhất 1 ký tự viết hoa';
    } else if (!containsLowercaseLetter(value)) {
      return 'Password cần chứa ít nhất 1 ký tự viết thường';
    } else if (!containsDigit(value)) {
      return 'Password cần chứa ít nhất 1 chữ số';
    } else {
      return null;
    }
  }

  String? validatorConfirmPassword(String? value) {
    if (value != password) {
      return 'Password nhập lại không khớp';
    } else {
      return null;
    }
  }

  String? validartorCheckName(String? name) {
    if ((name ?? '').isEmpty) {
      return 'Bắt buộc';
    } else if ((name ?? '').length < 3) {
      return 'Tối thiểu 3 ký tự';
    } else {
      return null;
    }
  }

  bool isValidSignupForm() {
    return formKey.currentState!.validate();
  }

  void resetForm() {
    email = null;
    password = null;
    confirmPassword = null;
    hoTen = null;
    formKey.currentState?.reset();
  }

  void _showSnackbar(String text) {
    Get.snackbar(
      'Success',
      text,
      snackPosition: SnackPosition.TOP,
    );
  }
}
