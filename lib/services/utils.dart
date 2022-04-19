import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          Random().nextInt(chars.length),
        ),
      ),
    );
  }

  static SnackBar errorSnackbar(String message) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
  }
}
