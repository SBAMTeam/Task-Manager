import 'package:flutter/material.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: sizedBoxBigSpace,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Get.width / 12),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Fname Lname',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          children: [
                            TextSpan(
                              text: '\nrole/job title',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: Get.width / 5,
                    ),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(9.0), //or 15.0
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        color: Color(0xffFF0E58),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
