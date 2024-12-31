import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/questions_screen.dart';



class Quiz extends StatefulWidget {
  
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}

class _QuizState extends State<Quiz>{

  Widget? screen;

  @override
  void initState() {
    screen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      screen = const QuestionsScreen();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple,Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: screen,
        ),
      ),
    );
  }
}