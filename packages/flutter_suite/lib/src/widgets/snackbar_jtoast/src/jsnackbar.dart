// ignore_for_file: unnecessary_this, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_suite/flutter_suite.dart';
part 'designs/jsnackbar_design.dart';

_JSnackBar? _snackBar;
void showJSnackBar(BuildContext context, {required JSnackbarConfig config}) {
  if (_snackBar?._context != context) {
    _snackBar = _JSnackBar(context);
  }
  _snackBar?.showSnackBar(config);
}

void removeJSnackBar() => _snackBar?.removeSnackBar();

class _JSnackBar {
  final BuildContext _context;
  final OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;
  _JSnackBar(BuildContext context)
      : _context = context,
        _overlayState = Overlay.of(context);

// Creating for receiving the user-generated onDismissed callback.
  late JSnackbarConfig config;

  void showSnackBar(JSnackbarConfig config) {
    this.config = config;
    if (_overlayEntry != null) {
      removeSnackBar();
    }

    // Create Overlay Entry
    _overlayEntry = OverlayEntry(
      builder: (context) =>
          // Add onDismissed Method in available tostwidget for internal use
          _SnackBarWidget(config: config, onDismissed: () => removeSnackBar()),
    );

    _overlayState?.insert(_overlayEntry!);
  }

  // Both methods will execute removeSnackBar(),
  // whether the snackbar is closed automatically or manually (forcefully dismissed).
  void removeSnackBar() {
    if (_overlayEntry != null) {
      if (config.onDismissed != null) config.onDismissed!();
      _overlayEntry?.remove();
      _overlayEntry?.dispose();
      _overlayEntry = null;
    }
  }
}

class _SnackBarWidget extends StatefulWidget {
  final JSnackbarConfig config;
  final VoidCallback onDismissed;

  const _SnackBarWidget({required this.config, required this.onDismissed});

  @override
  State<_SnackBarWidget> createState() => _TostStateWidget();
}

class _TostStateWidget extends State<_SnackBarWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  Timer? autoCanelTimer;
  late Duration currentTime;
  StreamController<Duration>? timeController;

  close([bool isReversePlay = true]) async {
    if (isReversePlay) {
      controller.reverse();
      await Future.delayed(widget.config.animationDuration);
    }
    widget.onDismissed();
  }

  @override
  void initState() {
    super.initState();
    currentTime = widget.config.duration;

    controller = AnimationController(
        value: 0,
        vsync: this,
        duration: widget.config.animationDuration,
        reverseDuration: widget.config.animationDuration)
      ..forward();
    if (widget.config.autoDismissed ?? true) {
      timeController = StreamController<Duration>.broadcast();
      autoCanelTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (currentTime != Duration.zero) {
          timeController?.sink
              .add(currentTime = currentTime - const Duration(seconds: 1));
        } else {
          autoCanelTimer?.cancel();
          close();
        }
      });
    }
  }

  @override
  void dispose() {
    if (autoCanelTimer?.isActive ?? false) autoCanelTimer?.cancel();
    timeController?.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var snakbar = _SnackBarDesign(
        inialSync: widget.config.duration,
        durationSync: timeController?.stream,
        config: widget.config,
        onDismissed: () => close(false));
    var align = widget.config.alignment;
    bool keyboardOpen = context.mQ.viewInsets.bottom > 0.0;
    double margin = keyboardOpen && !align.y.isNegative ? 0.8 : 0.2;
    return Padding(
      padding: widget.config.margin,
      child: Align(
        alignment: align.add(Alignment(0, -1 * align.y * margin)),
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) => FadeTransition(
                  opacity: controller,
                  child: FadeTransition(opacity: controller, child: snakbar),
                )),
      ),
    );
  }
}
