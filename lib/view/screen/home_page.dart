import 'package:carousel_slider/carousel_slider.dart';
import 'package:events_mvc/const/app_bar.dart';
import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/model/category_model.dart';
import 'package:events_mvc/view/widget/category.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [
    Category(name: 'Weddings', numbers: [1, 2, 3, 4, 7]),
    Category(name: 'Sad occasions', numbers: [5, 6]),
    Category(name: 'Graduation parties', numbers: [1, 2, 3, 7]),
    Category(name: 'Birthdays', numbers: [1, 2, 3, 7]),
  ];
  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    return Scaffold(
        backgroundColor: AppColor.light,
        appBar: mainAppBar(),
        drawer: const Drawer(),
        body: _buildHomePageBodyContent());
  }

  Widget _buildHomePageBodyContent() {
    final myImage = [
      Image.asset('ads1.png'),
      Image.asset('ads1.png'),
      Image.asset('ads1.png'),
    ];
    int myCurrentIndex = 0;
    // widget for scrolling
    return SingleChildScrollView(
      child: Column(children: [
        // widget for welcome message
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'HI ',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Dear ,',
                    style: TextStyle(
                        color: AppColor.darkPink,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Hope to help you organize \nyour event',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
        carouselSliderAds(myCurrentIndex, myImage),

        // categories text widget
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  'Please select the type of event',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Oswald",
                      color: AppColor.black,
                      fontSize: 19),
                ),
              ),
            ],
          ),
        ),

        // categories listview
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
              height: 80,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Categories(
                          category: categories[index],
                        ),
                      ),
                    ],
                  );
                },
              )),
        ),
        const SizedBox(
          height: 500,
        )
      ]),
    );
  }

// caroslider widget for ads
  Column carouselSliderAds(int myCurrentIndex, List<Image> myImage) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Row(
            children: [
              Text(
                'Offers For You:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Oswald",
                    // color: AppColor.black,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 175,

              viewportFraction: 1,
              //  autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(microseconds: 800),
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
            ),
            items: myImage,
          ),
        ),
      ],
    );
  }
}
