import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'tiles_jconfig/tile_jconfig.dart';

enum JDialogAction { autoClose, resetOnMaxExceed, unSelectAll, none }

class SelectJDialog<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextStyle? buttonsStyle, titleStyle, subtitleStyle;
  final JDialogButtonConfig<String>? button1;
  final JDialogButtonConfig<String>? button2;

  /// The maximum number of items that can be selected.
  final double maxSelect;

  /// The action to be taken when the maximum selection limit is exceeded.\
  /// By default ` actionOnMaxExceed = JDialogAction.none`
  final JDialogAction actionOnMaxExceed;
  final JDialogConfig config;

  /// Configuration for the tile within the dialog, which can
  /// be either a [ListTileJConfig] or a [GridTileJConfig].
  final TileJConfig tileJConfig;

  /// Opacity value for the subtitle text.
  /// By default `subtitleOpacity = 0.7`
  final double subtitleOpacity;
  final Function(List<String> result) onSelected;
  final MainAxisAlignment buttonAlignment;
  const SelectJDialog({
    super.key,
    required this.title,
    this.subtitle,
    this.buttonsStyle,
    this.titleStyle,
    this.subtitleStyle,
    this.button1,
    this.button2,
    this.subtitleOpacity = 0.7,
    required this.tileJConfig,
    required this.onSelected,
    this.config = const JDialogConfig(),
    this.buttonAlignment = MainAxisAlignment.spaceEvenly,
    required this.maxSelect,
    this.actionOnMaxExceed = JDialogAction.none,
  });

  @override
  Widget build(BuildContext context) {
    List<String> onChange(List<String> ls) {
      if (ls.length == maxSelect &&
          actionOnMaxExceed == JDialogAction.autoClose) {
        Navigator.pop(context);
      }
      if (ls.length > maxSelect &&
          actionOnMaxExceed == JDialogAction.resetOnMaxExceed) {
        return tileJConfig.selectedKeys;
      }
      if (ls.length > maxSelect &&
          actionOnMaxExceed == JDialogAction.unSelectAll) {
        return [];
      }

      return ls;
    }

    final child = SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle ?? context.textTheme.titleLarge,
          ),
          4.gap,
          if (subtitle.isNotNull)
            Text(
              subtitle!,
              style: subtitleStyle,
            ).opacity(subtitleOpacity),
          4.gap,
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: context.heightOf(60)),
              child: tileJConfig.build(context, onChange)),
          16.gap,
          if (button1 != null || button2 != null)
            Row(
              mainAxisAlignment: buttonAlignment,
              children: [
                if (button2 != null)
                  Flexible(
                    fit: FlexFit.values[button2!.enabledfullSize ? 0 : 1],
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: button2?.color,
                        textStyle: buttonsStyle,
                      ),
                      onPressed: button2?.onTap,
                      child: Text(button2!.text, style: buttonsStyle),
                    ).paddingOnly(right: 8),
                  ),
                if (button1 != null)
                  Flexible(
                    fit: FlexFit.values[button1!.enabledfullSize ? 0 : 1],
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button1?.color,
                        textStyle: buttonsStyle,
                      ),
                      onPressed: button1?.onTap,
                      child: Text(button1!.text),
                    ).paddingOnly(left: 8),
                  ),
              ],
            )
        ],
      ),
    );
    return config.createDialog(context, child);
  }
}
