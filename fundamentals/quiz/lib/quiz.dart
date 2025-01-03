import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/result_screen.dart';

class Quiz extends StatefulWidget {
  
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}

class _QuizState extends State<Quiz>{

  Widget? screen;
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        screen = ResultScreen(chosenAnswers: selectedAnswers,);
      });
    }    
  }

  @override
  void initState() {
    screen = StartScreen(switchScreen);
    selectedAnswers = [];
    super.initState();
  }

  void switchScreen(){
    setState(() {
      selectedAnswers = [];
      screen = QuestionsScreen(chooseAnswer: chooseAnswer);
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