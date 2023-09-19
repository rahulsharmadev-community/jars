part of '../jsnackbar.dart';

class _SnackBarDesign extends StatelessWidget {
  final Duration? inialSync;
  final Stream<Duration>? durationSync;
  final JSnackbarConfig config;
  final VoidCallback onDismissed;
  const _SnackBarDesign({
    required this.config,
    required this.onDismissed,
    this.inialSync,
    this.durationSync,
  });

  void _onManualDismissed() {
    onDismissed();
    if (config.onDismissed != null) config.onDismissed!();
  }

  List<Widget> _showTimer() {
    if (durationSync != null && (config.durationVisibility ?? true)) {
      return [
        StreamBuilder<Duration>(
            initialData: inialSync,
            stream: durationSync,
            builder: (context, s) {
              return Text('${s.data?.hms()}s',
                      style: TextStyle(fontWeight: FontWeight.w600, color: context.colorScheme.primaryContainer))
                  .paddingOnly(right: 8);
            })
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = (config.textStyle ?? context.textTheme.bodyMedium ?? const TextStyle()).copyWith(
      color: config.forgroundColor ?? context.colorScheme.onSecondary,
    );
    late Widget returnChild;

    Widget? title, subtitle;
    title = config.titleText != null ? Text(config.titleText!) : config.title;

    if (config.subTitleText != null) subtitle = Text(config.subTitleText!);
    if (config.subTitle != null) subtitle = config.title;

    returnChild = Theme(
      data: context.theme.copyWith(iconTheme: IconThemeData(color: context.colorScheme.primaryContainer)),
      child: ListTile(
        dense: true,
        title: title,
        iconColor: context.colorScheme.primaryContainer,
        subtitle: subtitle?.opacity(0.7),
        titleTextStyle: textStyle,
        subtitleTextStyle: textStyle,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        horizontalTitleGap: 8,
        leading: config.leading?.paddingAll(8).squareBox(42),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ..._showTimer(),
            if (config.trailing != null) config.trailing!.paddingAll(8),
          ],
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Dismissible(
        direction: config.dismissDirection,
        key: UniqueKey(),
        onDismissed: (_) => _onManualDismissed(),
        child: Material(
          type: MaterialType.card,
          elevation: config.elevation,
          clipBehavior: Clip.hardEdge,
          color: config.backgroundColor ?? context.colorScheme.secondary,
          borderRadius: config.borderRadius,
          child: Padding(padding: config.padding, child: returnChild),
        ),
      ),
    );
  }
}
