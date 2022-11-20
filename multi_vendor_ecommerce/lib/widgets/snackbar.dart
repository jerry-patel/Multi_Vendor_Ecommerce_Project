import 'package:flutter/material.dart';

class MyMessageHandler {

  static void showSnackBar(var scaffoldKey, String msg) {
    scaffoldKey.currentState!.hideCurrentSnackBar();
    scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          // backgroundColor: Colors.yellow,
          duration: const Duration(seconds: 2),
          content: Text(msg),
        )
    );
  }

}