import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/const/app_textstyle.dart';
import 'package:events_mvc/controller/register_controller.dart';
import 'package:events_mvc/view/widget/auth_button.dart';
import 'package:events_mvc/view/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisteScreen extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  RegisteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responseve design

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.light,

      // widget for scrolling

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Column(
                children: [
                  // widget for welcome message

                  Container(
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColor.pink,
                        AppColor.darkPink,
                        AppColor.morePink,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Register',
                                  style: AppTextStyle.authTitle(),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Welcome to our app! \nPlease  fill out the follwoing form to register',
                              style: AppTextStyle.welcomeMessage(),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // widget for textfeild

                  Column(children: [
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.7,
                      decoration: BoxDecoration(
                        color: AppColor.light,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: screenWidth * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: SizedBox(
                                  child: Column(children: [
                                    MyTextField(
                                      label: 'Name',
                                      controller:
                                          registerController.nameController,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyTextField(
                                      label: 'Number',
                                      controller:
                                          registerController.numberController,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    MyTextField(
                                      label: 'Email',
                                      controller:
                                          registerController.emailController,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyTextField(
                                      label: 'Password',
                                      controller:
                                          registerController.passwordController,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyTextField(
                                      label: 'Confirm password',
                                      controller: registerController
                                          .conPasswordController,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),

                                    // sign un button
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SizedBox(
                                          height: screenHeight * 0.05,
                                          width: 200,
                                          child: CustomButton(
                                            onPressed: () {
                                              registerController
                                                  .registerLogic(context);
                                            },
                                            title: 'Sign up',
                                          )),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
