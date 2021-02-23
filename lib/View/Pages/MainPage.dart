import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 8, vertical: Get.height / 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sizedBoxBigSpace,
              ),
              RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                      color: Color(textColor),
                      fontSize: 37,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nSBAM ',
                      style: TextStyle(
                          color: Color(0xffFF6366),
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Tasks.',
                      style: TextStyle(
                        color: Color(textColor),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height / 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBuilder(
                    height: 55.0,
                    edge: 22.0,
                    text: 'Create Server',
                  ),
                ],
              ),
              SizedBox(height: sizedBoxSmallSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBuilder(
                    height: 55.0,
                    edge: 22.0,
                    text: 'Join Server',
                    textColor: Color(textColor),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
