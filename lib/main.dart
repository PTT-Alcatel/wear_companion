import 'package:flutter/material.dart';
import 'package:ptt_companion/watch_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color.fromRGBO(97, 67, 209, 1)))
            .copyWith(scaffoldBackgroundColor: Colors.black),
        home: const WatchScreen(),
        debugShowCheckedModeBanner: false,
      );
}
