// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:events_mvc/model/user_model.dart';
import 'package:events_mvc/view/screen/admin_dash_board.dart';
import 'package:events_mvc/view/screen/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginLogic(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;
    //try catch
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      // check if user has an account
      if (response.statusCode == 200) {
        Map<String, dynamic> apiData = jsonDecode(response.body);
        print('API Data: $apiData \n\n\n\n\n');
        if (apiData.containsKey('User')) {
          //user account
          User user = User.fromJson(apiData['User']);
          if (user.role == 'user') {
            Get.to(() => const DashBoard());
          } else {
            Get.to(() => const AdminDashBoard());
          }
          // Save token to SharedPreferences
          final String? token = apiData['token'];
          await _saveToken(token);
        } else {
          Get.snackbar('Error', 'User data not found',
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        // error handling
        final responseBody = jsonDecode(response.body);
        final emailErrors = responseBody['email'] as List<dynamic>?;
        final passwordErrors = responseBody['password'] as List<dynamic>?;
        String emailErrorMessage =
            emailErrors?.isNotEmpty ?? false ? emailErrors![0] : '';
        String passwordErrorMessage =
            passwordErrors?.isNotEmpty ?? false ? passwordErrors![0] : '';

        Get.snackbar('Error', '$emailErrorMessage\n$passwordErrorMessage ',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to login. Please try again later.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _saveToken(String? token) async {
    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      print('token saved: $token');
    }
  }
}
