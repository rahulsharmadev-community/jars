import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

extension Rec4 on (num, num, num, num) {
  /// ### (topLeft, topRight, bottomLeft, bottomRight)
  /// Creates a `BorderRadius` with custom values for each corner.
  BorderRadius get rounded => BorderRadius.only(
        topLeft: Radius.circular($1.toDouble()),
        topRight: Radius.circular($2.toDouble()),
        bottomLeft: Radius.circular($3.toDouble()),
        bottomRight: Radius.circular($4.toDouble()),
      );

  /// Creates an `EdgeInsets` with custom values for left, top, right, and bottom.
  EdgeInsets get edges => EdgeInsets.fromLTRB($1.toDouble(), $2.toDouble(), $3.toDouble(), $4.toDouble());
}

/// Extension on a tuple of two numeric values, providing methods for
/// creating various `BorderRadius`, `EdgeInsets`, `Size`, and `Radius` objects.
extension Rec2 on (num, num) {
  /// ### (left, right)
  /// Creates a `BorderRadius` with custom values for the left and right sides.
  BorderRadius get roundedHorizontally => BorderRadius.horizontal(
        left: Radius.circular($1.toDouble()),
        right: Radius.circular($2.toDouble()),
      );

  /// ### (top, bottom)
  /// Creates a `BorderRadius` with custom values for the top and bottom sides.
  BorderRadius get roundedVertically => BorderRadius.vertical(
        top: Radius.circular($1.toDouble()),
        bottom: Radius.circular($2.toDouble()),
      );

  /// Creates a `BorderRadius` with custom values for the top-left and bottom-right,
  /// and top-right and bottom-left corners.
  BorderRadius get roundedDiagonally => BorderRadius.only(
        topLeft: Radius.circular($1.toDouble()),
        bottomRight: Radius.circular($1.toDouble()),
        topRight: Radius.circular($2.toDouble()),
        bottomLeft: Radius.circular($2.toDouble()),
      );

  /// ### (vertical, horizontal)
  /// Creates an `EdgeInsets` with symmetric vertical and horizontal values.
  EdgeInsets get edgesSymmetric {
    return EdgeInsets.symmetric(vertical: $1.toDouble(), horizontal: $2.toDouble());
  }

  /// ### (width, height)
  /// Creates a `Size` object with custom width and height.
  Size get size => Size($1.toDouble(), $2.toDouble());

  /// Creates an elliptical `Radius` with custom horizontal and vertical radii.
  Radius get ellipticalRadius => Radius.elliptical($1.toDouble(), $2.toDouble());

  /// Creates a `BorderRadius` with an elliptical radius.
  BorderRadius get elliptical => BorderRadius.all(ellipticalRadius);
}

/// Extension on a single numeric value, providing methods for
/// creating `BorderRadius`, `Radius`, and `EdgeInsets` objects.
extension Rec1 on num {
  /// Creates a `BorderRadius` with the same radius for all corners.
  BorderRadius get rounded => BorderRadius.circular(toDouble());

  /// Creates a circular `Radius` with the given value.
  Radius get circularRadius => Radius.circular(toDouble());

  /// Creates an `EdgeInsets` with the same padding for all sides.
  EdgeInsets get edges => EdgeInsets.all(toDouble());
}

/// Extension on `BorderRadius` to provide a method for creating
/// a `RoundedRectangleBorder`.
extension RadiusExt on BorderRadius {
  /// Creates a `RoundedRectangleBorder` with the given `BorderRadius`.
  RoundedRectangleBorder get shape => RoundedRectangleBorder(borderRadius: this);
}
