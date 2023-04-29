import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class PTTScreen extends StatefulWidget {
  const PTTScreen({Key? key}) : super(key: key);

  @override
  State<PTTScreen> createState() => _PTTScreenState();
}

class _PTTScreenState extends State<PTTScreen> {
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
