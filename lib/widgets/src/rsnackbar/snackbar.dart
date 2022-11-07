// ignore_for_file: unnecessary_this, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import '/core/library_core.dart';
part 'rsnackbar_design.dart';
part 'rsnackbar_config.dart';

_RSnackBar? _snackBar;
void showRSnackBar(BuildContext context, {required RSnackbarConfig config}) {
  if (_snackBar?._context != context) {
    _snackBar = _RSnackBar(context);
  }
  _snackBar?.showSnackBar(config);
}

void removeRSnackBar() => _snackBar?.removeSnackBar();

class _RSnackBar {
  final BuildContext _context;
  final OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;
  _RSnackBar(BuildContext context)
      : _context = context,
        _overlayState = Overlay.of(context);

// Creating for receiving the user-generated onDismissed callback.
  late RSnackbarConfig config;

  void showSnackBar(RSnackbarConfig config) {
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

  /// Both methods will execute removeSnackBar(),
  /// whether the snackbar is closed automatically or manually (forcefully dismissed).
  void removeSnackBar() {
    if (_overlayEntry != null) {
      if (config.onDismissed != null) config.onDismissed!();
      _overlayEntry?.remove();
      _overlayEntry?.dispose();
      _overlayEntry = null;

      // print('removeTost');
    }
  }
}

class _SnackBarWidget extends StatefulWidget {
  final RSnackbarConfig config;
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
    if (widget.config.autoDismissed) {
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
    // TODO: implement dispose
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
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Positioned(
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
            child: FadeTransition(opacity: controller, child: snakbar),
          )),
    );
  }
}
