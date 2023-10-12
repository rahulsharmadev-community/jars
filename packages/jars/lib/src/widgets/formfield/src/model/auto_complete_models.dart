import 'package:flutter/material.dart';

class AutoCompleteBoxDecoration {
  final EdgeInsetsGeometry? scrollPadding;
  final double? maxHeight;
  final double elevation;
  final Color? color;
  final Clip clipBehavior;
  final MaterialType type;
  final BorderRadiusGeometry borderRadius;
  final BorderSide side;

  const AutoCompleteBoxDecoration({
    this.scrollPadding,
    this.maxHeight,
    this.elevation = 6.0,
    this.color,
    this.clipBehavior = Clip.hardEdge,
    this.type = MaterialType.card,
    this.side = BorderSide.none,
    BorderRadiusGeometry? borderRadius,
  }) : borderRadius = borderRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
              topRight: Radius.circular(16),
            );

  RoundedRectangleBorder get shape =>
      RoundedRectangleBorder(borderRadius: borderRadius, side: side);
}

class AutoCompleteConfig {
  final bool showOptionsOnEmptyField;
  final bool disabledTextField;
  final bool openCloseIndicator;
  final IconData openIndicator;
  final IconData closeIndicator;
  AutoCompleteConfig({
    this.openCloseIndicator = false,
    this.showOptionsOnEmptyField = false,
    this.openIndicator = Icons.arrow_drop_down_rounded,
    this.closeIndicator = Icons.arrow_drop_up_rounded,
    this.disabledTextField = false,
  });
}
