import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/view/screen/archive_page.dart';
import 'package:events_mvc/view/screen/favorite_page.dart';
import 'package:events_mvc/view/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: camel_case_types, must_be_immutable
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  void changeIndex(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOption = [
      const HomePage(),
      const FavoritePage(),
      ArchivePage()
    ];

    return Scaffold(
      // endDrawer: myDrawer,
      body: Center(
        child: widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: AppColor.light,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: AppColor.morePink),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: GNav(
                gap: 0,
                padding: const EdgeInsets.all(16),
                backgroundColor: AppColor.morePink,
                color: AppColor.white,
                activeColor: AppColor.morePink,
                tabBackgroundColor: AppColor.white,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    iconSize: 24,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.favorite_border,
                    iconSize: 24,
                    text: 'Favorite',
                  ),
                  GButton(
                    icon: Icons.archive_rounded,
                    iconSize: 24,
                    text: 'Archive',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    print(index);
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
