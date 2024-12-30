import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  List<String> activeImages = List.generate(5, (index) => 'assets/images/dice-1.png');

  void rollDices() {
    setState(() {
      activeImages = List.generate(5, 
        (index) => 'assets/images/dice-${Random().nextInt(6) + 1}.png');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: activeImages
              .map((image) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(image, width: 100),
                  ))
              .toList(),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDices,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(color: Colors.white, fontSize: 28),
          ),
          child: const Text("Roll dices"),
        ),
      ],
    );
  }
}
