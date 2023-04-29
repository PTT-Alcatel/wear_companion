import 'package:flutter/material.dart';
import 'package:ptt_companion/ptt_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wear/wear.dart';

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
          body: HomeScreen(_randomCode),
        ),
      );
}

class HomeScreen extends StatefulWidget {
  final String randomCode;

  const HomeScreen(this.randomCode, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PTTScreen(),
            ),
          ),
          backgroundColor: Colors.purple,
          child: const Icon(
            Icons.navigate_next_rounded,
            size: 60,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    final watchScreenState =
                        context.findAncestorStateOfType<_WatchScreenState>();
                    if (watchScreenState != null) {
                      watchScreenState._generateRandomCode();
                    }
                  }),
                  child: QrImage(
                    foregroundColor: Colors.white,
                    data: widget.randomCode,
                    version: QrVersions.auto,
                    size: 100,
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      );
}
