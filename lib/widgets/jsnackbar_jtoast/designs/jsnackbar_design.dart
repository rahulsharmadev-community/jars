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

  MainAxisAlignment _mainAxis() {
    switch (config.alignment.x.toInt()) {
      case 0:
        return MainAxisAlignment.center;
      case -1:
        return MainAxisAlignment.start;
      default:
        return MainAxisAlignment.end;
    }
  }

  void _onManualDismissed() {
    onDismissed();
    config.onDismissed();
  }

  Widget _loadingDesgin() => Row(mainAxisAlignment: _mainAxis(), children: [
        SizedBox.square(dimension: 20, child: config.leading)
            .paddingOnly(right: 16),
        config.title,
        const Spacer(),
        _showTimer(),
        SizedBox.square(
            dimension: 20,
            child: InkWell(
              child: Icon(Icons.close,
                  color: config.forgroundColor?.withOpacity(0.7)),
              onTap: () => onDismissed(),
            )).paddingOnly(right: 16),
      ]);

  Widget _showTimer() {
    if (durationSync != null && (config.durationVisibility ?? true)) {
      return StreamBuilder<Duration>(
          initialData: inialSync,
          stream: durationSync,
          builder: (context, s) {
            // printInfo(
            //     'connectionState: ${s.connectionState}, data: ${s.data}, hasData: ${s.hasData}');
            return Text('${s.data?.hms()}s').paddingOnly(right: 8);
          });
    }
    return const Offstage();
  }

  Widget _iconDesgin() => Row(mainAxisAlignment: _mainAxis(), children: [
        config.leading!.paddingOnly(right: 16),
        config.title,
        const Spacer(),
        _showTimer(),
        InkWell(
          child: Icon(
            Icons.close,
            color: config.forgroundColor?.withOpacity(0.7),
          ),
          onTap: () => onDismissed(),
        ).paddingOnly(right: 8),
      ]);
  @override
  Widget build(BuildContext context) {
    late Widget returnChild;

    if (config is RSnackbarLoadingConfig) {
      returnChild = _loadingDesgin();
    } else if (config is RSnackbarIconConfig) {
      returnChild = _iconDesgin();
    } else {
      returnChild = Row(mainAxisAlignment: _mainAxis(), children: [
        if (config.leading != null) config.leading!.paddingAll(8),
        config.title,
        const Spacer(),
        _showTimer(),
        if (config.trailing != null) config.trailing!.paddingAll(8),
      ]);
    }

    return Dismissible(
      direction: config.dismissDirection,
      key: UniqueKey(),
      onDismissed: (_) => _onManualDismissed(),
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
