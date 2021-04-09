import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String text) {
  final snackBar = SnackBar(
    content: Text(text),
    duration: Duration(milliseconds: 2500),
  );
  ScaffoldMessenger.of(Get.context).showSnackBar(snackBar);
}

Future<bool> checkInternetConnection() async {
  try {
    // final result = await InternetAddress.lookup('example.com');
    final result = await InternetAddress.lookup('google.com');
    if ((result.isNotEmpty && result[0].rawAddress.isNotEmpty)) {
      print('Connected to internet');
      return true;
    }
  } on SocketException catch (_) {
    showSnackBar("Check your internet connection");
    return false;
  }
}
