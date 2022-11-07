import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class TextPlusDemo extends StatelessWidget {
  const TextPlusDemo({super.key});

  @override
  Widget build(BuildContext context) {
    String string =
        'Hello < ${TextStyle(color: Colors.red, fontSize: 20.sp, backgroundColor: Colors.orange).toTextPlusStyle} = "World 😂" > I am hear.';

    return LayoutBuilder(
      builder: ((p0, p1) {
        return Scaffold(body: TextPlus(string));
      }),
    );
  }
}
