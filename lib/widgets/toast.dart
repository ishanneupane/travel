import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  void show(
    String msg, {
    Color color = Colors.red,
  }) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color,
        timeInSecForIosWeb: 5,
        textColor: Colors.white,
        fontSize: 16);
  }
}
