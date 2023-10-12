import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'tile_jconfig.dart';

class GridTileJConfig implements TileJConfig {
  /// `keys` of selected `items`
  final List<String> keys;
  final List<JGridTile> items;

  final BorderRadius borderRadius;
  final bool hideBorder, hideIndicator;
  final Color? selectColor, unSelectColor;
  final ItemIndicator indicator;
  final SliverGridDelegate? gridDelegate;
  @override
  List<String> get selectedKeys => [...keys];

  GridTileJConfig(
      {this.keys = const [],
      required this.items,
      this.hideBorder = false,
      this.hideIndicator = false,
      BorderRadius? borderRadius,
      this.indicator = ItemIndicator.radiobox,
      this.selectColor,
      this.unSelectColor,
      this.gridDelegate})
      : borderRadius = borderRadius ?? BorderRadius.circular(8);
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

        var gridDelegate2 = gridDelegate ??
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            );

        return GridView(
          gridDelegate: gridDelegate2,
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
              )
          ],
        );
      },
    );
  }
}
