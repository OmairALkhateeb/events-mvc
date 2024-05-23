import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/view/screen/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar mainAppBar() {
  return AppBar(
    backgroundColor: AppColor.light,
    shadowColor: AppColor.darkPink,
    foregroundColor: AppColor.darkPink,
    surfaceTintColor: AppColor.darkPink,
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
            onPressed: () {
              Get.to(const Account());
            },
            icon: const Icon(
              Icons.person,
            )),
      )
    ],
  );
}
