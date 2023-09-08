import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class JMarqueeDemo extends StatelessWidget {
  const JMarqueeDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Marquee(
            maxHeight: 50,
            scrollAxis: Axis.horizontal,
            accelerationCurve: Curves.fastLinearToSlowEaseIn,
            pauseAfterRound: 3.seconds,
            blankSpace: 10,
            velocity: 100,
            child: const FlutterLogo(
                size: 100, style: FlutterLogoStyle.horizontal),
          ),
          Marquee(
            maxHeight: 50,
            blankSpace: 50,
            child: JTextPlus(
                '<r>JMarquee</r> is a flutter widget that scrolls widget infinitely.',
                jTextStyles: [JTextStyle('r', color: Colors.red)]),
          ),
        ],
      )),
    );
  }
}
