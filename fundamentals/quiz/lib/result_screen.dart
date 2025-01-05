import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/components/questions_sumary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers,required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  //dict
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> sumarry = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      sumarry.add({
        'index': i,
        'question': questions[i].text,
        'correct': questions[i].answers[0],
        'answered': chosenAnswers[i]
      });
    }
    return sumarry;
  }

  @override
  Widget build(BuildContext context) {
    final sumaryData = getSummaryData();
    final numberTotalQuestions = questions.length;
    final numberCorrectQuestions = sumaryData.where((e) {
      return e['answered'] == e['correct'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You ansered $numberCorrectQuestions out of $numberTotalQuestions questions correctly",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSumary(data: sumaryData),
            SizedBox(
              height: 30,
            ),
            TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              iconColor: Colors.white
            ),
            onPressed: restartQuiz, 
            label: Text("Restart Quiz"), 
            icon: Icon(Icons.refresh),)
          ],
        ),
      ),
    );
  }
}
