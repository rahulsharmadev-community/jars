import 'package:flutter/material.dart';
import 'package:jars/jars.dart';
import 'formfield/src/model/text_field_model.dart';

class FormBuilder extends StatefulWidget {
  final String? title, subtitle, caption;
  final List<dynamic> children;
  final List<Widget> actions;
  final MainAxisAlignment actionsAlignment;
  final TextStyle? titleStyle, subtitleStyle, captionStyle;

  /// Opacity value for the subtitle text.
  /// By default `subtitleOpacity = 0.7`
  final double subtitleOpacity;

  /// title and subtitle alignment
  final CrossAxisAlignment alignment;

  /// Gap between FormFieldJarModel
  final double verticalGap;
  final double horizontalGap;

  const FormBuilder({
    super.key,
    required this.children,
    this.actions = const [],
    this.title,
    this.subtitle,
    this.subtitleOpacity = 0.7,
    this.alignment = CrossAxisAlignment.start,
    this.verticalGap = 16,
    this.horizontalGap = 16,
    this.actionsAlignment = MainAxisAlignment.spaceEvenly,
    this.caption,
    this.titleStyle,
    this.subtitleStyle,
    this.captionStyle,
  });

  @override
  State<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  var ls = <Widget>[];
  @override
  void initState() {
    int i = 0;
    while (i < widget.children.length) {
      Widget? child;
      if (widget.children[i] is JTextFieldModel) {
        var temp = widget.children[i] as JTextFieldModel;
        child = _reSolveJTextField(temp);
      } else if (widget.children[i] is Set<JTextFieldModel> ||
          widget.children[i] is List<JTextFieldModel>) {
        var temp = widget.children[i] as List;
        for (int j = 0; j < temp.length; j += 2) {
          j + 1 < temp.length
              ? ls.add(_row(temp[j], temp[j + 1]))
              : ls.add(_reSolveJTextField(temp[j]));
        }
      } else {
        child = widget.children[i];
      }
      if (child != null) ls.add(child);
      i++;
    }
    super.initState();
  }

  Widget _row(JTextFieldModel $1, JTextFieldModel $2) {
    return Row(
      children: [
        Expanded(child: _reSolveJTextField($1)),
        widget.verticalGap.gap,
        Expanded(child: _reSolveJTextField($2)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.mediaQuery.viewInsets.bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: widget.alignment,
          children: [
            if (widget.title!=null)
              Text(widget.title!, style: context.textTheme.titleLarge).semiBold,
            if (widget.subtitle!=null) Text(widget.subtitle!).opacity(0.7),
            16.gap,
            ...ls.map((e) => e.paddingOnly(bottom: widget.horizontalGap)),
            if (widget.actions.isNotEmpty)
              Row(
                  mainAxisAlignment: widget.actionsAlignment,
                  children: widget.actions),
            if (widget.caption!=null)
              Center(
                  child: Text(widget.caption!, textAlign: TextAlign.center)
                      .paddingOnly(bottom: 4, top: 16)
                      .opacity(0.5))
          ],
        ),
      ),
    );
  }

  JTextFieldModel _reSolveJTextField(JTextFieldModel temp) {
    temp.onFocus = () => FocusScope.of(context).nextFocus();
    return temp;
  }
}
