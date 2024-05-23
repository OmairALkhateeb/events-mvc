import 'package:events_mvc/const/app_colore.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  // login & register
  static TextStyle authTitle() {
    return TextStyle(
        fontSize: 40, fontWeight: FontWeight.bold, color: AppColor.light);
  }
   // welcomeMessage
  static TextStyle welcomeMessage() {
    return TextStyle(
      fontSize: 20,
      color: AppColor.light,
    );
  }
}
