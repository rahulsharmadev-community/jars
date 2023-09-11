// ignore_for_file: unnecessary_this, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'configs/jrtoast_config.dart';
part 'designs/jtoast_design.dart';

_RToast? _toast;
void showRTost(BuildContext context,
    {required String msg, JToastConfig? config}) {
  if (_toast?._context != context) {
    _toast = _RToast(context);
  }
  _toast?.showToast(msg, config);
}

void removeRTost() => _toast?.removeToast();

class _RToast {
  final BuildContext _context;
  final OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;
  _RToast(BuildContext context)
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
    widget.config.onDismissed();
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

    timer = Timer.periodic(widget.config.duration, (_) {
      // print('Auto Close from initState');
      close();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
            top: widget.config.alignment.y < 0
                ? widget.config.farFromEdge * controller.value
                : widget.config.alignment.y == 0
                    ? 0
                    : null,
            bottom: widget.config.alignment.y > 0
                ? widget.config.farFromEdge * controller.value
                : widget.config.alignment.y == 0
                    ? 0
                    : null,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: controller,
              child: _ToastDesign(widget.msg,
                  config: widget.config, onDismissed: () => close(false)),
            ));
      },
    );
  }
}
