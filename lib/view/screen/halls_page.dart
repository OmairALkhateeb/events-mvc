import 'package:events_mvc/const/app_bar.dart';
import 'package:events_mvc/services/get_all_halls.dart';
import 'package:events_mvc/model/lounges_model.dart';
import 'package:events_mvc/view/widget/halls_page_deisgn.dart';
import 'package:flutter/material.dart';
class HalsPage extends StatelessWidget {
  // ignore: use_super_parameters
  const HalsPage({
    Key? key,
    required this.categoryName,
    required this.numbers,
  }) : super(key: key);  

  final String? categoryName;
  final List<int> numbers;
  static String id = 'HalsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [],
        floatHeaderSlivers: true,
        body: FutureBuilder<List<Lounges>>(
          future: HalsService().getallhals(category: categoryName),
          // Pass category name to getallhals method
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Lounges> allHals = snapshot.data!;
              return GridView.builder(
                itemCount: allHals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return HalsPageDesgin(
                    hals: allHals[index],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
