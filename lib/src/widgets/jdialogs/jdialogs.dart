import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'src/model/jdialog_model.dart';
import 'src/tiles_jconfig/tile_jconfig.dart';

export 'src/model/jgridtile.dart';
export 'src/model/jlisttile.dart';
export 'src/model/item_indicator.dart';
export 'src/configs/jdialog_config.dart';
export 'src/tiles_jconfig/gridtile_jconfig.dart';
export 'src/tiles_jconfig/listtile_jconfig.dart';

class AlertJDialog extends JDialogModel {
  final String content;
  final TextStyle? contentStyle;
  final double opacity;
  const AlertJDialog(
      {super.key,
      required super.title,
      required this.content,
      super.icon,
      super.config = const JDialogConfig(),
      this.opacity = 0.7,
      super.actions,
      super.actionsAlignment,
      super.titleStyle,
      this.contentStyle});

  @override
  Widget build(BuildContext context) {
    final child = SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!.fittedBox(72),
          18.gap,
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle ?? context.textTheme.headlineMedium,
          ),
          8.gap,
          Text(
            content,
            textAlign: TextAlign.center,
            style: contentStyle,
          ).opacity(opacity),
          28.gap,
          if (actions.isNotEmpty)
            Row(mainAxisAlignment: actionsAlignment, children: actions),
        ],
      ),
    );

    return config.createDialog(context, child);
  }
}

class InfoJDialog extends JDialogModel {
  final String content;
  final TextStyle? contentStyle;
  final double opacity;
  const InfoJDialog(
      {super.key,
      required super.title,
      required this.content,
      super.icon,
      this.opacity = 0.7,
      super.titleStyle,
      super.subtitleStyle,
      super.subtitleOpacity,
      this.contentStyle,
      super.subtitle});

  @override
  Widget build(BuildContext context) {
    final child = SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!.fittedBox(72),
          18.gap,
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle ?? context.textTheme.headlineMedium,
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: subtitleStyle ?? context.textTheme.labelMedium,
            ).opacity(subtitleOpacity),
          8.gap,
          Text(
            content,
            textAlign: TextAlign.center,
            style: contentStyle,
          ).opacity(opacity),
        ],
      ),
    );

    return config.createDialog(context, child);
  }
}

enum JDialogAction { autoClose, resetOnMaxExceed, unSelectAll, none }

class SelectJDialog<T> extends JDialogModel {
  /// The maximum number of items that can be selected.
  final double maxSelect;

  /// The action to be taken when the maximum selection limit is exceeded.\
  /// By default ` actionOnMaxExceed = JDialogAction.none`
  final JDialogAction actionOnMaxExceed;

  /// Configuration for the tile within the dialog, which can
  /// be either a [ListTileJConfig] or a [GridTileJConfig].
  final TileJConfig tileJConfig;
  final Function(List<String> result) onSelected;
  const SelectJDialog({
    super.key,
    required super.title,
    super.subtitle,
    super.titleStyle,
    super.subtitleStyle,
    super.subtitleOpacity = 0.7,
    required this.tileJConfig,
    required this.onSelected,
    super.config = const JDialogConfig(),
    required this.maxSelect,
    this.actionOnMaxExceed = JDialogAction.none,
    super.actions = const [],
    super.actionsAlignment = MainAxisAlignment.spaceEvenly,
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
          if (subtitle!=null)
            Text(
              subtitle!,
              style: subtitleStyle,
            ).opacity(subtitleOpacity),
          4.gap,
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: context.heightOf(60)),
              child: tileJConfig.build(context, onChange)),
          16.gap,
          if (actions.isNotEmpty)
            Row(mainAxisAlignment: actionsAlignment, children: actions),
        ],
      ),
    );
    return config.createDialog(context, child);
  }
}
