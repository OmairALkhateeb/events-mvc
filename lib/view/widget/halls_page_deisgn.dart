// ignore: file_names
import 'package:events_mvc/model/lounges_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HalsPageDesgin extends StatefulWidget {
  HalsPageDesgin({super.key, required this.hals});
  Lounges hals;

  @override
  State<HalsPageDesgin> createState() => _HalsPageDesginState();
}

class _HalsPageDesginState extends State<HalsPageDesgin> {
  bool liked = true;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        //    Get.toNamed('/newscreen');
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Color.fromARGB(255, 139, 138, 138),
                spreadRadius: 1,
              )
            ],
            image: DecorationImage(
                image: AssetImage(widget.hals.image.toString()),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0),
                  const Color.fromARGB(255, 43, 42, 42).withOpacity(0.7)
                ], stops: const [
                  0.0,
                  0.7
                ], begin: Alignment.center, end: Alignment.bottomCenter)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  alignment: Alignment.topLeft,
                  width: screenwidth,
                  height: screenheight * 0.07,
                  margin: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.hals.nameOfHall.toString().substring(0, 5),
                            style: TextStyle(
                                color: const Color(0xffFFF5E0),
                                fontSize: screenheight * 0.04),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenwidth * 0.1,
                      ),
                      IconButton(
                        icon: Icon(
                          liked ? Icons.favorite_border : Icons.favorite,
                        ),
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            liked = !liked;
                          });
                        },
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
