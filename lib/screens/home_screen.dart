import 'package:flutter/material.dart';
import 'package:ptt_companion/screens/ptt_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String randomCode;

  @override
  void initState() {
    super.initState();
    _generateRandomCode();
  }

  void _generateRandomCode() {
    setState(() {
      randomCode = 'CODE_${DateTime.now().microsecondsSinceEpoch}';
    });
  }

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
                    _generateRandomCode();
                  }),
                  child: QrImage(
                    foregroundColor: Colors.white,
                    data: randomCode,
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
