// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:events_mvc/view/screen/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  //controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conPasswordController = TextEditingController();

  Future<void> registerLogic(BuildContext context) async {
    final String name = nameController.text;
    final String number = numberController.text;
    final String password = passwordController.text;
    final String confPassword = conPasswordController.text;
    final String email = emailController.text;
    // confermation password
    if (password != confPassword) {
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    // try catch
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone_number': number,
          'password_confirmation': confPassword,
        },
      );
      // check if everything is fine
      if (response.statusCode == 200) {
        Map<String, dynamic> apiData = jsonDecode(response.body);
        final String? token = apiData['token'];

        print('token saved: $token');
        await _saveToken(token);
        Get.to(() => const DashBoard());
      } else {
        final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        String errorMessage = '';
        //email error
        if (responseBody.containsKey('email')) {
          final emailErrors = responseBody['email'] as List<dynamic>;
          errorMessage +=
              'Email: ${emailErrors.isNotEmpty ? emailErrors[0] : ''}\n';
        }
        //number error
        if (responseBody.containsKey('phone_number')) {
          final numberErrors = responseBody['phone_number'] as List<dynamic>;
          errorMessage +=
              'Phone Number: ${numberErrors.isNotEmpty ? numberErrors[0] : ''}\n';
        }
        //password error
        if (responseBody.containsKey('password')) {
          final passwordErrors = responseBody['password'] as List<dynamic>;
          errorMessage +=
              'Password: ${passwordErrors.isNotEmpty ? passwordErrors[0] : ''}\n';
        }

        Get.snackbar('Error', errorMessage.trim(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to register user: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _saveToken(String? token) async {
    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('Token', token);
      print('Token saved: $token');
    }
  }
}
