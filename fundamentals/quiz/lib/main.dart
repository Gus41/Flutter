import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple,Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: StartScreen(),
        ),
      ),
    )
  );
}

