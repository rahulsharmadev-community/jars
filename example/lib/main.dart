import 'package:example/demos/export.dart';
import 'package:jars/jars.dart';
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
        '/RToastandRSnakBarDemo': (context) => const RToastandRSnakBarDemo(),
        '/JTextPlusDemo': (context) => const JTextPlusDemo(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
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
            JTextPlus(
                'Welcome in <r>JARS ❤️</r> Demo\n<s>developed by @rahulsharmadev</s>',
                jTextStyles: [
                  JTextStyle('r',
                      color: Colors.red.shade400, fontWeight: FontWeight.bold),
                  JTextStyle('s', fontSize: 12.dp)
                ],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.dp, color: Colors.white)),
            const SizedBox(height: 64),
            ...{
              '/JMarqueeDemo': 'JMarquee Demo',
              '/RToastandRSnakBarDemo': 'RToast & RSnakBar Demo',
              '/JTextPlusDemo': 'JTextPlus Demo',
            }
                .entries
                .map((e) => TextButton(
                      onPressed: () =>
                          navigatorKey.currentState?.pushNamed(e.key),
                      child: e.value.wText(),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
