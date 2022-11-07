// ignore_for_file: camel_case_extensions
part of 'platform_query.dart';

extension PlatformQueryExtension_NUM on num {
  /// Respective percentage of the viewport's smaller dimension.
  double get vmin =>
      this * min(PlatformQuery.height, PlatformQuery.width) / 100;

  /// Respective percentage of the viewport's larger dimension.
  double get vmax =>
      this * max(PlatformQuery.height, PlatformQuery.width) / 100;

  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * PlatformQuery.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's width
  double get w => this * PlatformQuery.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's pixel
  /// density and aspect ratio
  double get sp =>
      this *
      (((h + w) + (PlatformQuery.pixelRatio * PlatformQuery.aspectRatio)) /
          2.08) /
      100;

  /// Calculates the material dp (Pixel Density)
  /// (https://material.io/design/layout/pixel-density.html#pixel-density-on-android))
  // double get dp => this * (w * 160) / PlatformQuery.pixelRatio;

  double get dp => (log(PlatformQuery.width *
              PlatformQuery.height *
              PlatformQuery.pixelRatio) /
          log(2) /
          18 *
          this)
      .abs();
}
