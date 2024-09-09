import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Dicee',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          )),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftD = 1;
  int rightD = 1;

  void rollDice() {
    setState(() {
      leftD = Random().nextInt(6) + 1;
      rightD = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                rollDice();
                debugPrint('Left Button got pressed.');
              },
              child: Image.asset('images/dice$leftD.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  rollDice();
                  debugPrint('Right Button got pressed.');
                });
              },
              child: Image.asset('images/dice$rightD.png'),
            ),
          ),
        ],
      ),
    );
  }
}
