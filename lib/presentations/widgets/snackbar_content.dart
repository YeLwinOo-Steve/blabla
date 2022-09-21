import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SnackbarContent {
  static void errorSnackBar(BuildContext context, String error) {
    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: error,
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void successSnackBar(BuildContext context, String success) {
    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Congratulations!',
        message: success,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}