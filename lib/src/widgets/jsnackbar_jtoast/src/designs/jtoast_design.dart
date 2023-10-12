part of '../jtoast.dart';

class _ToastDesign extends StatelessWidget {
  final String msg;
  final JToastConfig config;
  final VoidCallback onDismissed;
  const _ToastDesign(
    this.msg, {
    required this.config,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle =
        (config.textStyle ?? context.textTheme.bodySmall ?? const TextStyle());
    return Dismissible(
      direction: config.dismissDirection,
      key: UniqueKey(),
      onDismissed: (_) {
        onDismissed();
        if (config.onDismissed != null) config.onDismissed!();
      },
      child: Material(
        type: MaterialType.card,
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        color: config.backgroundColor ?? context.colorScheme.secondary,
        borderRadius: config.borderRadius,
        textStyle: textStyle.copyWith(
          color: config.forgroundColor ?? context.colorScheme.onSecondary,
        ),
        child: Padding(
          padding: config.padding,
          child: Text(
            msg,
            textAlign: config.textAlign,
          ),
        ),
      ),
    );
  }
}
