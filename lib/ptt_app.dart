import 'package:flutter/material.dart';
import 'package:ptt_companion/home_watch_screen.dart';

class PttApp extends StatelessWidget {
  const PttApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
                useMaterial3: true,
                colorScheme:
                    ColorScheme.fromSwatch(primarySwatch: Colors.purple))
            .copyWith(scaffoldBackgroundColor: Colors.black),
        home: const WatchScreen(),
        debugShowCheckedModeBanner: false,
      );
}
