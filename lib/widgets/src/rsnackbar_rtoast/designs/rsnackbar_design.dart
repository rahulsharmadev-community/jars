part of '../rsnackbar.dart';

class _SnackBarDesign extends StatelessWidget {
  final Duration? inialSync;
  final Stream<Duration>? durationSync;
  final RSnackbarConfig config;
  final VoidCallback onDismissed;
  const _SnackBarDesign({
    required this.config,
    required this.onDismissed,
    this.inialSync,
    this.durationSync,
  });

  MainAxisAlignment mainAxis() {
    switch (config.alignment.x.toInt()) {
      case 0:
        return MainAxisAlignment.center;
      case -1:
        return MainAxisAlignment.start;
      default:
        return MainAxisAlignment.end;
    }
  }

  void onManualDismissed() {
    onDismissed();
    config.onDismissed();
  }

  Widget loadingDesgin() => Row(mainAxisAlignment: mainAxis(), children: [
        SizedBox.square(dimension: 20, child: config.leading)
            .wPaddingOnly(right: 16),
        config.title,
        const Spacer(),
        showTimer(),
        SizedBox.square(
            dimension: 20,
            child: InkWell(
              child: Icon(Icons.close,
                  color: config.forgroundColor?.withOpacity(0.7)),
              onTap: () => onDismissed(),
            )).wPaddingOnly(right: 16),
      ]);

  Widget showTimer() {
    if (durationSync != null && (config.durationVisibility ?? true)) {
      return StreamBuilder<Duration>(
          initialData: inialSync,
          stream: durationSync,
          builder: (context, s) {
            // printInfo(
            //     'connectionState: ${s.connectionState}, data: ${s.data}, hasData: ${s.hasData}');
            return Text('${s.data?.hms()}s').wPaddingOnly(right: 8);
          });
    }
    return const Offstage();
  }

  Widget iconDesgin() => Row(mainAxisAlignment: mainAxis(), children: [
        config.leading!.wPaddingOnly(right: 16),
        config.title,
        const Spacer(),
        showTimer(),
        InkWell(
          child: Icon(
            Icons.close,
            color: config.forgroundColor?.withOpacity(0.7),
          ),
          onTap: () => onDismissed(),
        ).wPaddingOnly(right: 8),
      ]);
  @override
  Widget build(BuildContext context) {
    late Widget returnChild;

    if (config is RSnackbarLoadingConfig) {
      returnChild = loadingDesgin();
    } else if (config is RSnackbarIconConfig) {
      returnChild = iconDesgin();
    } else {
      returnChild = Row(mainAxisAlignment: mainAxis(), children: [
        if (config.leading != null) config.leading!.wPaddingAll(8),
        config.title,
        const Spacer(),
        showTimer(),
        if (config.trailing != null) config.trailing!.wPaddingAll(8),
      ]);
    }

    return Dismissible(
      direction: config.dismissDirection,
      key: UniqueKey(),
      onDismissed:
          config.onDismissed != null ? (_) => onManualDismissed() : null,
      child: Card(
        elevation: config.elevation,
        clipBehavior: Clip.hardEdge,
        color: config.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: config.borderRadius),
        child: Padding(
            padding: config.padding,
            child: DefaultTextStyle(
                style: config.textStyle.copyWith(color: config.forgroundColor),
                child: returnChild)),
      ),
    );
  }
}
