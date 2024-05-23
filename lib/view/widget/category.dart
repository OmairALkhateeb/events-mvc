import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/model/category_model.dart';
import 'package:events_mvc/view/screen/halls_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  final Category category;

  const Categories({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColor.pink,
            AppColor.darkPink,
            AppColor.morePink,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              category.name,
              style: TextStyle(
                color: AppColor.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        // Handle category tap
        Get.to(HalsPage(
          categoryName: category.name,
          numbers: category.numbers,
        ));
      },
    );
  }
}
