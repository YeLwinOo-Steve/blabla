import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';

class CustomDropDown extends StatelessWidget {
  late String defaultValue;
  final List<String> items;
  final Function(String?) onChanged;

  CustomDropDown({required this.items, required this.defaultValue, required this.onChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      iconEnabledColor: ColorManager.BUTTON_BACKGROUND_COLOR_WHITE,
        underline: const SizedBox(),
        isExpanded: true,
        style: const TextStyle(color: Colors.white),
        dropdownColor: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE,
        borderRadius: BorderRadius.circular(RadiusManager.r10),
        items: items.map((String item) {
          return DropdownMenuItem(value: item, child: Center(child: Text(item,style: const TextStyle(color: ColorManager.TEXT_COLOR_WHITE),)));
        }).toList(),
        value: defaultValue,
        onChanged: onChanged);
  }
}
