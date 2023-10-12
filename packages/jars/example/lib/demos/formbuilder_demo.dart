import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class FormBuilderDemo extends StatefulWidget {
  const FormBuilderDemo({
    super.key,
  });

  @override
  State<FormBuilderDemo> createState() => _FormBuilderDemoState();
}

class _FormBuilderDemoState extends State<FormBuilderDemo> {
  TextEditingController? controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'USA',
      'China',
      'Japan',
      'Germany',
      'India',
      'United',
      'France',
      'Italy',
      'Canada',
      'Brazil'
    ];
    const listTile = ListTile(
        tileColor: Colors.amberAccent,
        title: Text('ListTile Title'),
        subtitle: Text('ListTile subtitle'));
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          child: const Text('Open Dialog'),
          onPressed: () {
            showModalBottomSheet(
                showDragHandle: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return FormBuilder(
                    title: "Osm Field",
                    subtitle: "amazing textfield subtitle",
                    caption:
                        'Our CategoryNewsState class contains a copyWith method, which will be used by our bloc to emit a state by altering selected parameters',
                    children: [
                      JTextField(
                        labelText: 'Normal',
                        hintText: 'Hint Text',
                        onSubmitted: onSubmit,
                      ),
                      JTextField.obscureField(
                        labelText: 'Obscure',
                        inital: '123',
                        hintText: 'Hint Text',
                        onSubmitted: onSubmit,
                      ),
                      SmartJTextField.autoCompleteField(
                        options: items,
                        inital: items.first,
                        onChange: (text) => print({'autoCompleteField': text}),
                        onSubmitted: onSubmit,
                      ),
                      listTile,
                      SmartJTextField.dropdownField(
                        options: items,
                        inital: items.first,
                        onChange: onSubmit,
                      ),
                      listTile,
                    ],
                  );
                });
          },
        ),
      ),
    );
  }

  void onSubmit(text) {
    showJSnackBar(context, config: JSnackbarConfig(titleText: text));
  }
}
