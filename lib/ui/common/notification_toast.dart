// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

mixin NotificationToast {
  static Future<bool?> showToast({
    required BuildContext context,
    required String message,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      timeInSecForIosWeb: 2,
      fontSize: 16,
    );
  }
}
