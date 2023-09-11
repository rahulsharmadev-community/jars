import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jars/utility.dart';
part 'marquee_curveImp.dart';

class Marquee extends StatefulWidget {
  Marquee({
    super.key,
    required this.child,
    required this.maxHeight,
    double? maxWidth,
    this.scrollDirection = ScrollDirection.forward,
    this.scrollAxis = Axis.horizontal,
    this.blankSpace = 0.0,
    this.velocity = 50.0,
    this.startAfter = Duration.zero,
    this.pauseAfterRound = Duration.zero,
    this.numberOfRounds,
    this.startPadding = 0.0,
    this.accelerationDuration = Duration.zero,
    Curve accelerationCurve = Curves.linear,
    this.onDone,
  })  : maxWidth = maxWidth ?? PlatformQuery.width,
        assert(!blankSpace.isNaN),
        assert(blankSpace >= 0, "The blankSpace needs to be positive or zero."),
        assert(blankSpace.isFinite),
        assert(!velocity.isNaN),
        assert(velocity > 49.0, "The velocity cannot be less then 50."),
        assert(velocity.isFinite),
        assert(
          pauseAfterRound >= Duration.zero,
          "The pauseAfterRound cannot be negative as time travel isn't "
          "invented yet.",
        ),
        assert((maxWidth ?? PlatformQuery.width) > 1,
            "The maxWidth value should be greater then 0"),
        assert(numberOfRounds == null || numberOfRounds > 0),
        assert(
          accelerationDuration >= Duration.zero,
          "The accelerationDuration cannot be negative as time travel isn't "
          "invented yet.",
        ),
        accelerationCurve = _MarqueeCurveImp(accelerationCurve);

  final StatelessWidget child;
  final ScrollDirection scrollDirection;
  final Axis scrollAxis;
  final double blankSpace;
  final double velocity;
  final Duration startAfter;
  final Duration pauseAfterRound;
  final int? numberOfRounds;
  final double maxWidth;
  final double maxHeight;
  final double startPadding;
  final Duration accelerationDuration;
  // ignore: library_private_types_in_public_api
  final _MarqueeCurveImp accelerationCurve;

  final VoidCallback? onDone;

  @override
  State<StatefulWidget> createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();

  // The scroll positions at various scrolling phases.
  late double _startPosition; // At the start, before accelerating.
  late double
      _accelerationTarget; // After accelerating, before moving linearly.
  late double _linearTarget; // After moving linearly, before decelerating.

  late Duration _totalDuration; // The durations of various scrolling phases.
  late Duration _linearDuration; // The duration of linearly scrolling.

  Duration get _accelerationDuration => widget.accelerationDuration;

  bool isRunning = false;
  bool isOnPause = false;
  int roundCounter = 0;
  bool get isDone => widget.numberOfRounds == null
      ? false
      : widget.numberOfRounds == roundCounter;

  @override
  void initState() {
    super.initState();
    _initializeVariables();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!isRunning) {
        isRunning = true;
        if (_controller.hasClients) {
          _controller.jumpTo(_startPosition);
          await Future<void>.delayed(widget.startAfter);
          Future.doWhile(_scroll);
        }
      }
    });
  }

  Future<bool> _scroll() async {
    await _makeRoundTripAndHandlePauseCall();
    if (isDone && widget.onDone != null) {
      widget.onDone!();
    }
    return isRunning && !isDone && _controller.hasClients;
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget as Marquee);
  }

  @override
  void dispose() {
    isRunning = false;
    super.dispose();
  }

  void _initializeVariables() {
    // Calculate lengths (amount of pixels that each phase needs).
    final totalLength = widget.maxWidth + widget.blankSpace;

    _startPosition = 2 * totalLength - widget.startPadding;
    _accelerationTarget = totalLength;
    _linearTarget = _accelerationTarget + totalLength;

    // Calculate durations for the phases.
    _totalDuration = _accelerationDuration +
        Duration(milliseconds: (totalLength / widget.velocity * 1000).toInt());
    _linearDuration = _totalDuration - _accelerationDuration;
  }

  // After a certain round, handle pause calls.
  Future<void> _makeRoundTripAndHandlePauseCall() async {
    // Reset the controller, then jump to certen index then move animate
    if (!_controller.hasClients) return;
    _controller.jumpTo(_startPosition);
    if (!isRunning) return;

    await _jumpIndex();
    if (!isRunning) return;

    await _executeAnimation();
    if (!isRunning) return;
    roundCounter++;

    if (widget.pauseAfterRound > Duration.zero) {
      if (!mounted) setState(() => isOnPause = true);

      await Future.delayed(widget.pauseAfterRound);

      if (!mounted || isDone) return;
      setState(() => isOnPause = false);
    }
  }

  // Methods that animate the controller.
  Future<void> _jumpIndex() =>
      _animateTo(target: _accelerationTarget, duration: _accelerationDuration);

  Future<void> _executeAnimation() =>
      _animateTo(target: _linearTarget, duration: _linearDuration);

  Future<void> _animateTo({
    required double target,
    required Duration duration,
  }) async {
    if (!_controller.hasClients) return;
    if (duration > Duration.zero) {
      await _controller.animateTo(target,
          duration: duration, curve: widget.accelerationCurve.original);
    } else {
      _controller.jumpTo(target);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: widget.maxWidth, maxHeight: widget.maxHeight),
      child: ListView.builder(
        controller: _controller,
        scrollDirection: widget.scrollAxis,
        reverse: widget.scrollDirection == ScrollDirection.reverse,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) {
          return Center(child: i.isEven ? widget.child : _buildBlankSpace());
        },
      ),
    );
  }

  Widget _buildBlankSpace() {
    return SizedBox(
      width: widget.scrollAxis == Axis.horizontal ? widget.blankSpace : null,
      height: widget.scrollAxis == Axis.vertical ? widget.blankSpace : null,
    );
  }
}
