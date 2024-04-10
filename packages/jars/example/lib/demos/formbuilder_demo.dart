import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

class FormBuilderDemo extends StatelessWidget {
  const FormBuilderDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onSubmit(String text) {
      showJSnackBar(context, config: JSnackbarConfig(titleText: text));
    }

    const listTile = ListTile(
        tileColor: Colors.amberAccent, title: Text('ListTile Title'), subtitle: Text('ListTile subtitle'));
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
                      listTile,
                      listTile,
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
