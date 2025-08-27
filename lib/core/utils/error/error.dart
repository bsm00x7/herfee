import 'package:flutter/material.dart';

class CustomErrorWidget {
  // Show error SnackBar
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[400],
        content: Text(message),
      ),
    );
  }


}
