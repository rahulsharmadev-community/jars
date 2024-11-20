// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_suite/flutter_suite.dart';

class JToastandJSnakBarDemo extends StatelessWidget {
  const JToastandJSnakBarDemo({super.key});

  simpleTile(String text, {VoidCallback? onPressed, VoidCallback? onDismissed}) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onPressed,
              child: Text(text),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onDismissed,
            icon: const Icon(Icons.delete_forever),
          )
        ]),
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Row(children: [
        Text('RSnackBar Sample',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: context.theme.primaryColor)),
        const Spacer()
      ]).paddingVertical(8),
      simpleTile('Simple Loading Snackbar',
          onPressed: () => showJSnackBar(context, config: JSnackbarConfig.loading()),
          onDismissed: () => removeJSnackBar()),
      simpleTile('Design Loading Snackbar',
          onPressed: () => showJSnackBar(context,
              config: JSnackbarConfig.loading(
                  text: 'Loading.....',
                  progressIndicatorColor: Colors.amber,
                  borderRadius: BorderRadius.circular(8))),
          onDismissed: () => removeJSnackBar()),
      simpleTile('Simple Icon Snackbar',
          onPressed: () => showJSnackBar(context,
              config: JSnackbarConfig.icon(
                'Complete Successfully',
                icon: Icons.check_circle,
              )),
          onDismissed: () => removeJSnackBar()),
      simpleTile('Customize Snackbar',
          onDismissed: () => removeJSnackBar(),
          onPressed: () => showJSnackBar(context,
              config: JSnackbarConfig(
                title: const Text('Please wait while i processing..'),
                onDismissed: () {
                  showJTost(context, msg: 'Dismissed Successfully');
                },
                trailing: InkWell(
                    child: const Icon(
                      Icons.close,
                    ),
                    onTap: () => removeJSnackBar()),
              ))),
      Row(children: [
        Text('RToast Sample',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: context.theme.primaryColor)),
        const Spacer()
      ]).paddingVertical(8),
      const TostView(),
    ];
    return Scaffold(
        appBar: AppBar(title: const Text('RSnackBar & RToast Demo')),
        body: SafeArea(
            child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                itemCount: children.length,
                itemBuilder: (context, index) => children[index])));
  }
}

class TostData {
  final String title;
  final bool isExpanded;
  final List<Widget> widgets;

  TostData(this.title, this.isExpanded, this.widgets);
  copyWith({String? title, bool? isExpanded, List<Widget>? widgets}) =>
      TostData(title ?? this.title, isExpanded ?? this.isExpanded, widgets ?? this.widgets);
}

class TostView extends StatefulWidget {
  const TostView({
    Key? key,
  }) : super(key: key);

  @override
  State<TostView> createState() => _TostViewState();
}

class _TostViewState extends State<TostView> {
  late List<TostData> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      TostData('Toast form top', false, [
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form top center.', config: JToastConfig(alignment: Alignment.topCenter)),
          child: const Text('TOP CENTER'),
        ),
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form top left.', config: JToastConfig(alignment: Alignment.topLeft)),
          child: const Text('TOP LEFT'),
        ),
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form top right.', config: JToastConfig(alignment: Alignment.topRight)),
          child: const Text('TOP RIGHT'),
        ),
      ]),
      TostData('Toast form bottom', false, [
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form bottom center.', config: JToastConfig(alignment: Alignment.bottomCenter)),
          child: const Text('BOTTOM CENTER'),
        ),
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form bottom left.', config: JToastConfig(alignment: Alignment.bottomLeft)),
          child: const Text('BOTTOM LEFT'),
        ),
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form bottom right.', config: JToastConfig(alignment: Alignment.bottomRight)),
          child: const Text('BOTTOM RIGHT'),
        )
      ]),
      TostData('Toast form center', false, [
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form center.', config: JToastConfig(alignment: Alignment.center)),
          child: const Text('CENTER'),
        ),
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form center left.', config: JToastConfig(alignment: Alignment.centerLeft)),
          child: const Text('CENTER LEFT'),
        ),
        OutlinedButton(
          onPressed: () => showJTost(context,
              msg: '👋 Hi i am form center right.', config: JToastConfig(alignment: Alignment.centerRight)),
          child: const Text('CENTER RIGHT'),
        )
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      children: list
          .map((e) => ExpansionPanel(
              isExpanded: true,
              body: Column(
                  children: List.generate(e.widgets.length, (index) => ListTile(title: e.widgets[index]))),
              headerBuilder: (BuildContext context, bool isExpanded) => ListTile(title: Text(e.title))))
          .toList(),
    );
  }
}
