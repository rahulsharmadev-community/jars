// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlignJar {
  final Widget widget;
  AlignJar(this.widget);

  Align topLeft({double? widthFactor, double? heightFactor}) => Align(
      alignment: Alignment.topLeft, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);

  Align topCenter({double? widthFactor, double? heightFactor}) => Align(
      alignment: Alignment.topCenter, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);

  Align topRight({double? widthFactor, double? heightFactor}) => Align(
      alignment: Alignment.topRight, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);

  Align centerLeft({double? widthFactor, double? heightFactor}) => Align(
      alignment: Alignment.centerLeft, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);

  Align center({double? widthFactor, double? heightFactor}) =>
      Align(alignment: Alignment.center, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);

  Align centerRight({double? widthFactor, double? heightFactor}) => Align(
      alignment: Alignment.centerRight, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);

  Align bottomLeft({double? widthFactor, double? heightFactor}) => Align(
      alignment: Alignment.bottomLeft, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);

  Align bottomCenter({double? widthFactor, double? heightFactor}) => Align(
      alignment: Alignment.bottomCenter, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);

  Align bottomRight({double? widthFactor, double? heightFactor}) => Align(
      alignment: Alignment.bottomRight, widthFactor: widthFactor, heightFactor: heightFactor, child: widget);
}
