// ignore_for_file: unnecessary_this, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jars/extensions.dart';
import 'configs/jrtoast_config.dart';
part 'designs/jtoast_design.dart';

_JToast? _toast;

bool get isJTostAlive => _toast?._overlayEntry != null;

void showJTost(BuildContext context,
    {required String msg, JToastConfig? config}) {
  if (_toast?._context != context) {
    _toast = _JToast(context);
  }
  _toast?.showToast(msg, config);
}

void removeJTost() => _toast?.removeToast();

class _JToast {
  final BuildContext _context;
  final OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;
  _JToast(BuildContext context)
      : _context = context,
        _overlayState = Overlay.of(context);

  void showToast(String msg, [JToastConfig? config]) {
    if (_overlayEntry != null) {
      removeToast();
    }

    // Create Overlay Entry
    _overlayEntry = OverlayEntry(
      builder: (context) =>
          // Add onDismissed Method in available tostwidget for internal use
          _ToastWidget(msg,
              config: (config ?? JToastConfig())
                  .copyWith(onDismissed: () => removeToast())),
    );

    _overlayState?.insert(_overlayEntry!);
  }

  void removeToast() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry?.dispose();
      _overlayEntry = null;
      // print('removeTost');
    }
  }
}

class _ToastWidget extends StatefulWidget {
  final String msg;
  final JToastConfig config;

  const _ToastWidget(this.msg, {super.key, required this.config});

  @override
  State<_ToastWidget> createState() => _TostStateWidget();
}

class _TostStateWidget extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  close([bool isReversePlay = true]) async {
    if (isReversePlay) {
      controller.reverse();
      await Future.delayed(widget.config.animationDuration);
    }
    if (widget.config.onDismissed != null) widget.config.onDismissed!();
  }

  Timer? timer;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        value: 0,
        vsync: this,
        duration: widget.config.animationDuration,
        reverseDuration: widget.config.animationDuration)
      ..forward();

    timer = Timer.periodic(widget.config.duration, (_) => close());
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var align = widget.config.alignment;
    bool keyboardOpen = context.mediaQuery.viewInsets.bottom > 0.0;
    double margin = keyboardOpen && !align.y.isNegative ? 0.8 : 0.2;
    return Padding(
      padding: widget.config.margin,
      child: Align(
        alignment: align.add(Alignment(0, -1 * align.y * margin)),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return FadeTransition(
              opacity: controller,
              child: _ToastDesign(widget.msg,
                  config: widget.config, onDismissed: () => close(false)),
            );
          },
        ),
      ),
    );
  }
}
