import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'tile_jconfig.dart';

class ListTileJConfig implements TileJConfig {
  /// `keys` of selected `items`
  final List<String> keys;
  final List<JListTile> items;
  final BorderRadius borderRadius;
  final bool hideBorder, hideIndicator;
  final Color? selectColor, unSelectColor;
  final ItemIndicator indicator;

  @override
  List<String> get selectedKeys => [...keys];

  ListTileJConfig({
    this.keys = const [],
    required this.items,
    this.hideBorder = false,
    this.hideIndicator = false,
    BorderRadius? borderRadius,
    this.indicator = ItemIndicator.radiobox,
    this.selectColor,
    this.unSelectColor,
  }) : borderRadius = borderRadius ?? BorderRadius.circular(8);
  @override
  Widget build(context, onChange) {
    var keysTemp = selectedKeys;
    return StatefulBuilder(
      builder: (context, setState) {
        void onTap(String key) {
          keysTemp.contains(key) ? keysTemp.remove(key) : keysTemp.add(key);
          setState(() {
            keysTemp = onChange(keysTemp);
          });
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++)
                InkWell(
                  onTap: () => onTap(items[i].uniqueKey),
                  borderRadius: borderRadius,
                  child: items[i].copyWidth(
                    indicator: hideIndicator
                        ? null
                        : indicator.widget(context,
                            value: keysTemp.contains(items[i].uniqueKey),
                            color: selectColor,
                            onChanged: (p0) => onTap(items[i].uniqueKey)),
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      border: hideBorder
                          ? null
                          : Border.all(
                              color: keysTemp.contains(items[i].uniqueKey)
                                  ? selectColor ?? context.colorScheme.primary
                                  : unSelectColor ?? Colors.transparent),
                    ),
                  ),
                ).paddingVertical(4),
            ],
          ),
        );
      },
    );
  }
}
