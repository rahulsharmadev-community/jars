import 'package:jars/jars.dart';

import 'demos/export.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AppRun());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRun extends StatelessWidget {
  const AppRun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/JMarqueeDemo': (context) => const JMarqueeDemo(),
        '/JToastandJSnakBarDemo': (context) => const JToastandJSnakBarDemo(),
        '/JDialogsDemo': (context) => const JDialogsDemo(),
        '/FormBuilderDemo': (context) => const FormBuilderDemo(),
      },
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Welcome in JARS ❤️ Demo\ndeveloped by @rahulsharmadev',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Colors.white)),
            const SizedBox(height: 64),
            ...{
              '/JMarqueeDemo': 'JMarquee Demo',
              '/JToastandJSnakBarDemo': 'JToast & JSnakBar Demo',
              '/JDialogsDemo': 'JDialogs Demo',
              '/FormBuilderDemo': 'FormBuilder Demo'
            }
                .entries
                .map((e) => TextButton(
                      onPressed: () => navigatorKey.currentState?.pushNamed(e.key),
                      child: Text(e.value),
                    ))
                .toList(),
            12.gap,
            const DropdownMenuExample(),
            Container(
                constraints: BoxConstraints(maxHeight: 300, maxWidth: 200), child: JTextField(expands: true)),
            // JTextField(expands: true),
          ],
        ),
      ),
    );
  }
}

final items = <Map>[
  {786: 'USA'},
  {267: 'China'},
  {564: 'Japan'},
  {170: 'Germany'},
  {560: 'India'},
  {975: 'United'},
  {450: 'France'},
  {415: 'Italy'},
  {919: 'Canada'},
  {272: 'Brazil'}
];

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  var entries = items.map((e) => DropdownMenuEntry<Map>(value: e, label: e.values.first)).toList();
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Map>(
        dropdownMenuEntries: entries,
        controller: controller,
        enableSearch: true,
        enableFilter: true,
        searchCallback: (entries, query) {
          if (query.isBlank) return null;
          final int index = entries.indexWhere((entry) => entry.label == query);
          return index != -1 ? index : null;
        });
  }
}
