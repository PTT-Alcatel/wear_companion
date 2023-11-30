import 'package:flutter/material.dart';
import 'package:ptt_companion/screens/connection_screen.dart';
import 'package:ptt_companion/screens/ptt_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton.small(
          shape: const CircleBorder(),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ConnectionScreen(),
            ),
          ),
          backgroundColor: Colors.purple,
          child: const Icon(
            Icons.navigate_next_rounded,
            size: 40,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PTT Companion',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      );
}
