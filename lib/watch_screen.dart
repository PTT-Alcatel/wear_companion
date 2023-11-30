// watch_screen.dart
import 'package:flutter/material.dart';
import 'package:ptt_companion/screens/home_screen.dart';
import 'package:wear/wear.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  @override
  Widget build(BuildContext context) => WatchShape(
        builder: (context, shape, child) => const Scaffold(
          body: HomeScreen(),
        ),
      );
}
