import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/view/screen/admin_achive_page.dart';
import 'package:events_mvc/view/screen/admin_home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  int _selectedIndex = 0;

  void changeIndex(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOption = [const AdminHomePage(), AdminArchivePage()];

    return Scaffold(
      body: Center(
        child: widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: AppColor.light,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 70, right: 70, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: AppColor.morePink),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
