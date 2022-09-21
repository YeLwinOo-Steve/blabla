import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintLabel;
  final bool onlyNumber;
  final int maxLine;
  const CustomTextField({
    this.onlyNumber = false,
    this.maxLine = 1,
    required this.hintLabel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      keyboardType: onlyNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(

          filled: true,
          label: Text(hintLabel),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE),
          )),
    );
  }
}