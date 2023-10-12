import 'package:flutter/material.dart';

enum ItemIndicator {
  checkbox,
  radiobox;

  Widget widget(
    BuildContext context, {
    Color? color,
    required bool value,
    Function(bool?)? onChanged,
  }) {
    switch (this) {
      case ItemIndicator.radiobox:
        return Radio.adaptive(
          value: value,
          groupValue: true,
          toggleable: true,
          onChanged: onChanged,
          activeColor: color,
        );
      default:
        return Checkbox.adaptive(
          value: value,
          onChanged: onChanged,
          activeColor: color,
        );
    }
  }
}
