import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class JTextPlusDemo extends StatelessWidget {
  const JTextPlusDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var text = '''<b>class</b> MyApp <b>extends</b> StatelessWidget {
  <lb>@override</lb>
  Widget <y>build</y>(BuildContext <lb>context</lb>) {
    return MaterialApp(
      <lb>title</lb>: <or>'Flutter Demo'</or>,
      <lb>debugShowCheckedModeBanner</lb>: false,
      <lb>theme</lb>: ThemeData(
        primarySwatch: Colors.blue,
      ),
      <lb>home</lb>: const MyHomePage(title: <or>'Flutter Demo Home Page'</or>),
    );
  }
}''';
    var rules2 = [
      JTextStyle('<b>',
          color: const Color.fromARGB(255, 70, 138, 255),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
      JTextStyle('<lb>', color: Colors.lightBlue.shade200),
      JTextStyle('<y>', color: Colors.yellow.shade200),
      JTextStyle('<or>', color: Colors.orange),
    ];

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          JTextPlus(
            text,
            style: const TextStyle(
                fontSize: 25, color: Colors.white, letterSpacing: 1.5),
            jTextStyles: rules2,
          ),
        ],
      )),
    );
  }
}
