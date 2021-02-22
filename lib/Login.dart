import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/TextField_Builder.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var iconColor = 0xff3F3D56;
    var textColor = 0xff3F3D56;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width / 8, vertical: Get.height / 13),
          child: Column(
            children: [
              Image.asset('assets/images/signin_image.png'),
              SizedBox(
                height: Get.height / 30,
              ),
              Row(
                children: [
                  Text(
                    'Sign In:',
                    style: TextStyle(
                      fontSize: Get.height / 20,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff3F3D56),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              TextField_Builder(),
              SizedBox(
                height: Get.height / 60,
              ),
              TextField_Builder(
                icon: Icon(
                  Icons.lock,
                  color: Color(iconColor),
                  size: 35,
                ),
                hint: 'Password',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(
                          textColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              Text(
                'Enter code provided by Company',
                style:
                    TextStyle(color: Color(textColor), fontSize: 18),
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              PinCodeTextField(
                boxShadows: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      offset: Offset(1, 3))
                ],
                enableActiveFill: true,
                length: 6,
                backgroundColor: Colors.black.withOpacity(0),
                obscureText: false,
                textStyle: TextStyle(
                  color: Color(0xff3F3D56),
                ),
                pinTheme: PinTheme(
                  selectedFillColor: Colors.white,
                  selectedColor: Color(0xffFF6366),
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.white,
                  activeColor: Color(0xff3F3D56),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(90),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
                appContext: context,
                onChanged: (String value) {},
              ),
              SizedBox(
                height: Get.height / 60,
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
                  width: 200,
                  height: 50,
                  //color: Color(0xffFF6366),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 4,
                          offset: Offset(1, 3),
                        ),
                      ],
                      color: Color(0xffFF6366),
                      borderRadius: BorderRadius.circular(90)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
