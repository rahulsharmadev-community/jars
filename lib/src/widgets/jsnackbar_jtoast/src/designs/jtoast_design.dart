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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Dismissible(
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
            textStyle: (config.textStyle ?? context.textTheme.bodySmall ?? const TextStyle())
                .copyWith(color: context.colorScheme.onSecondary),
            color: config.backgroundColor ?? context.colorScheme.secondary,
            borderRadius: config.borderRadius,
            child: Padding(
              padding: config.padding,
              child: Text(msg),
            ),
          ),
        ),
      ],
    );
  }
}
