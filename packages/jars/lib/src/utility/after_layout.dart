import 'dart:async';
import 'package:flutter/widgets.dart';

mixin AfterLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) afterFirstLayout(context, timeStamp);
    });

  }

  FutureOr<void> afterFirstLayout(BuildContext context, Duration timeStamp);
}
