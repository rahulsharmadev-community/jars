import 'package:flutter/material.dart';

extension FlexExtensions on Flex {
  Flex copyWith({
    Key? key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    TextDirection? textDirection,
    VerticalDirection? verticalDirection,
    TextBaseline? textBaseline,
    Clip? clipBehavior,
    List<Widget>? children,
  }) =>
      Flex(
        key: key,
        direction: direction,
        mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
        mainAxisSize: mainAxisSize ?? this.mainAxisSize,
        crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
        textDirection: textDirection ?? this.textDirection,
        verticalDirection: verticalDirection ?? this.verticalDirection,
        textBaseline: textBaseline ?? this.textBaseline,
        clipBehavior: clipBehavior ?? this.clipBehavior,
        children: children ?? this.children,
      );
}
