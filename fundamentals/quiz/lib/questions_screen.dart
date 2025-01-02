import 'package:flutter/material.dart';
import 'package:quiz/components/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  var index = 0;

  void onClick() {


    if(index == questions.length-1){
      return;
    }
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = questions[index];

    return Center(
      child: Container(
      margin: const EdgeInsets.all(38),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 26,
          ),
          ...currentQuestion.getShuffledAnswers().map((e) {
            return AnswerButton(e, onClick);
          }),
        ],
      ),
    ));
  }
}
