import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Wear App',
        theme: ThemeData(useMaterial3: true, primaryColor: Colors.red),
        home: const WatchScreen(),
        debugShowCheckedModeBanner: false,
      );
}

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  String _randomCode = '';

  @override
  void initState() {
    super.initState();
    _generateRandomCode();
  }

  void _generateRandomCode() {
    setState(() {
      _randomCode = 'CODE_${DateTime.now().microsecondsSinceEpoch}';
    });
  }

  @override
  Widget build(BuildContext context) => WatchShape(
        builder: (context, shape, child) => Scaffold(
          body: StartScreen(_randomCode),
        ),
      );
}

class StartScreen extends StatefulWidget {
  final String randomCode;

  const StartScreen(this.randomCode, {Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: widget.randomCode,
                  version: QrVersions.auto,
                  size: 100.0,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => setState(() {
                    final watchScreenState =
                        context.findAncestorStateOfType<_WatchScreenState>();
                    if (watchScreenState != null) {
                      watchScreenState._generateRandomCode();
                    }
                  }),
                  child: const Text('Generate Code'),
                ),
                // make a button to go the next screen
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NextScreen(),
                    ),
                  ),
                  child: const Text('Next Screen'),
                ),
              ],
            ),
          ),
        ),
      );
}

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) => WatchShape(
      builder: (context, shape, child) => Scaffold(
              body: Center(
                  // make a push to talk button
                  child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 150),
                  shape: const CircleBorder(),
                  backgroundColor: isPressed ? Colors.purple : Colors.white,
                ),
                child: Icon(
                  Icons.mic,
                  size: 60,
                  color: isPressed ? Colors.white : Colors.purple,
                ),
              )
            ],
          ))));
}
