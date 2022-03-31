import 'dart:math';
import 'package:flutter/material.dart';

class DiceApp extends StatelessWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _diceIndex = 0;
  final List<String> images = ['1', '2', '3', '4', '5', '6'];
  final Random random = Random();

  void _rollDice() => setState(() {
        _diceIndex = random.nextInt(6);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice app'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: _rollDice,
              child: Image.asset(
                /// 1- get image path using images [List]
                // 'assets/images/dice/${images[_diceIndex]}.png',
                /// 2- get image path using [_diceIndex] (without images [List])
                'assets/images/dice/${_diceIndex + 1}.png',
              ),
            ),
          ),
          const Text(
            'Tap the dice to roll',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
