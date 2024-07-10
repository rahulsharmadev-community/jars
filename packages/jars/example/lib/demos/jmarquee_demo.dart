import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'package:jars/jars_core.dart';

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
            pauseAfterRound: 3.seconds,
            blankSpace: 10,
            velocity: 100,
            widget: const FlutterLogo(
                size: 100, style: FlutterLogoStyle.horizontal),
          ),
          const Icon(Icons.account_circle_outlined),
          Marquee(
            blankSpace: 100,
            text:
                'JMarquee is a flutter widget that scrolls widget infinitely.',
            style: const TextStyle(color: Colors.red),
          ),
        ],
      )),
    );
  }
}
