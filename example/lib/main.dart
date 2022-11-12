import 'package:jars/jars.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        backgroundColor: Colors.black45,
        body: Center(
          child: SizedBox(
            width: 400,
            child: HomeScreen(),
          ),
        ),
      ),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          JMarquee(
            maxHeight: 50,
            scrollAxis: Axis.horizontal,
            accelerationCurve: Curves.linear,
            onDone: () => printInfo('Finish'),
            blankSpace: 10,
            maxWidth: 400,
            velocity: 100,
            child: Container(width: 200, color: Colors.red),
          ),
        ],
      )),
    );
  }
}
