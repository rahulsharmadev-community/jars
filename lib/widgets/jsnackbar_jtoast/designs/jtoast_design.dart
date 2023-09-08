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

    return Row(
      mainAxisAlignment: mainAxis(),
      mainAxisSize: MainAxisSize.min,
      children: [
        Dismissible(
          direction: config.dismissDirection,
          key: UniqueKey(),
          onDismissed: (_) {
            onDismissed();
            config.onDismissed();
          },
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: config.borderRadius),
            clipBehavior: Clip.hardEdge,
            color: config.backgroundColor,
            child: Padding(
              padding: config.padding,
              child:
                  DefaultTextStyle(style: config.textStyle, child: Text(msg)),
            ),
          ),
        ),
      ],
    );
  }
}
