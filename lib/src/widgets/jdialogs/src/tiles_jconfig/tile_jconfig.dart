import 'package:flutter/widgets.dart';

abstract class TileJConfig {
  List<String> get selectedKeys;
  Widget build(
    BuildContext context,
    List<String> Function(List<String> keys) onChange,
  );
}
