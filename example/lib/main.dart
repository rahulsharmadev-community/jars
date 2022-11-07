import 'package:flutter/material.dart';
import 'package:jars/jars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToastandSnakBar(),
    ),
  );
}

class ToastandSnakBar extends StatelessWidget {
  const ToastandSnakBar({super.key});

  simpleTile(String text,
          {VoidCallback? onPressed, VoidCallback? onDismissed}) =>
      Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: [
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
          ].wRow());

  @override
  Widget build(BuildContext context) {
    String string =
        'TextPlus Demo < ${TextStyle(color: Colors.red, fontSize: 20.sp, backgroundColor: Colors.orange).toTextPlusStyle} = "World 😂" > I am hear.';
    List<Widget> children = [
      [
        Text('RSnackBar Sample',
            style: TextStyle(
                fontSize: 18.dp,
                fontWeight: FontWeight.w600,
                color: context.theme.primaryColor)),
        const Spacer()
      ].wRow().wPaddingSymmetric(vertical: 8),
      simpleTile('Simple Loading Snackbar',
          onPressed: () =>
              showRSnackBar(context, config: RSnackbarLoadingConfig('Loading')),
          onDismissed: () => removeRSnackBar()),
      simpleTile('Design Loading Snackbar',
          onPressed: () => showRSnackBar(context,
              config: RSnackbarLoadingConfig('Loading',
                  progressIndicatorColor: Colors.amber,
                  borderRadius: BorderRadius.circular(8))),
          onDismissed: () => removeRSnackBar()),
      simpleTile('Simple Icon Snackbar',
          onPressed: () => showRSnackBar(context,
              config: RSnackbarIconConfig(
                  'Complete Successfully', Icons.check_circle)),
          onDismissed: () => removeRSnackBar()),
      simpleTile('Customize Snackbar',
          onDismissed: () => removeRSnackBar(),
          onPressed: () => showRSnackBar(context,
              config: RSnackbarConfig(
                const Text('Please wait while i processing..'),
                onDismissed: () {
                  printInfo('onDismissed');
                  showRTost(context, msg: 'Dismissed Successfully');
                },
                trailing: InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.white70,
                    ),
                    onTap: () => removeRSnackBar()),
              ))),
      [
        Text('RToast Sample',
            style: TextStyle(
                fontSize: 18.dp,
                fontWeight: FontWeight.w600,
                color: context.theme.primaryColor)),
        const Spacer()
      ].wRow().wPaddingSymmetric(vertical: 8),
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
      TostData(title ?? this.title, isExpanded ?? this.isExpanded,
          widgets ?? this.widgets);
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
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form top center.',
              config: RToastConfig(alignment: Alignment.topCenter)),
          child: const Text('TOP CENTER'),
        ),
        OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form top left.',
              config: RToastConfig(alignment: Alignment.topLeft)),
          child: const Text('TOP LEFT'),
        ),
        OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form top right.',
              config: RToastConfig(alignment: Alignment.topRight)),
          child: const Text('TOP RIGHT'),
        ),
      ]),
      TostData('Toast form bottom', false, [
        OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form bottom center.',
              config: RToastConfig(alignment: Alignment.bottomCenter)),
          child: const Text('BOTTOM CENTER'),
        ),
        OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form bottom left.',
              config: RToastConfig(alignment: Alignment.bottomLeft)),
          child: const Text('BOTTOM LEFT'),
        ),
        OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form bottom right.',
              config: RToastConfig(alignment: Alignment.bottomRight)),
          child: const Text('BOTTOM RIGHT'),
        )
      ]),
      TostData('Toast form center', false, [
        OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form center.',
              config: RToastConfig(alignment: Alignment.center)),
          child: const Text('CENTER'),
        ),
        OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form center left.',
              config: RToastConfig(alignment: Alignment.centerLeft)),
          child: const Text('CENTER LEFT'),
        ),
        OutlinedButton(
          onPressed: () => showRTost(context,
              msg: '👋 Hi i am form center right.',
              config: RToastConfig(alignment: Alignment.centerRight)),
          child: const Text('CENTER RIGHT'),
        )
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        printInfo(isExpanded);
        setState(() => list[panelIndex] =
            list[panelIndex].copyWith(isExpanded: !isExpanded));
      },
      children: list
          .map((e) => ExpansionPanel(
              isExpanded: e.isExpanded,
              body: List.generate(e.widgets.length,
                  (index) => ListTile(title: e.widgets[index])).wColumn(),
              headerBuilder: (BuildContext context, bool isExpanded) =>
                  ListTile(title: Text(e.title))))
          .toList(),
    );
  }
}
