import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dice1Image = "assets/dice1.png";

  String dice2Image = "assets/dice1.png";
  int score = 0;
  int _clickCount = 0;
  bool _isButtonDisabled = false;

  void rollDice() {
    int randomNumber = Random().nextInt(6) + 1;
    int randomNumber2 = Random().nextInt(6) + 1;
    setState(() {
      dice1Image = "assets/dice$randomNumber.png";
      dice2Image = "assets/dice$randomNumber2.png";
      _clickCount++;

      if (_clickCount >= 10) {
        _isButtonDisabled = true;
        if ((randomNumber == 1 && randomNumber2 == 1) ||
            (randomNumber == 6 && randomNumber2 == 6)) {
          score += 10;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Dice Roll Project"),
        actions: [
          Text(
            'Score: $score',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                dice1Image,
                height: 120,
                width: 120,
              ),
              Image.asset(
                dice2Image,
                height: 120,
                width: 120,
              )
            ],
          ),
          ElevatedButton(
            onPressed: _isButtonDisabled ? null : rollDice,
            child: Text(
              "Roll Dice",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
