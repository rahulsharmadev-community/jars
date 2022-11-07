import 'dart:convert';
import 'extensions.dart';
import 'package:flutter/material.dart';

class TextPlus extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextPlus(this.text, {super.key, this.style});

  List<Map<String, dynamic>> _convertToAtt(String str) {
    var map = str.split(RegExp(r'[<|>]'));
    List<Map<String, dynamic>> rmap = [];
    for (int i = 0; i < map.length; i++) {
      if (map[i].trim().isEmpty) {
        map.removeAt(i);
        i--;
      } else {
        var st = map[i].split('=');
        Map<String, dynamic> tamp = {};
        for (int j = 0; j < st.length; j++) {
          if (st.length > 1) {
            var code = st[j].trim();
            if (code[0] == code[code.length - 1] && code[0] == '"') {
              tamp.addAll({'text': code.substring(1, code.length - 1)});
            } else {
              var textStyle = Map<String, dynamic>.from(jsonDecode(st[j]))
                  .fromTextPlusStyle;
              tamp.addAll({'textStyle': textStyle});
            }
            rmap.add(tamp);
          } else {
            rmap.addAll([
              {'text': st.first}
            ]);
          }
        }
      }
    }
    return rmap;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: style ?? DefaultTextStyle.of(context).style,
            children: _convertToAtt(text)
                .map((e) => TextSpan(text: e['text'], style: e['textStyle']))
                .toList()));
  }
}
