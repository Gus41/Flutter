
import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
class ResultScreen extends StatelessWidget {

  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  //dict 
  List<Map<String,Object>> setSummaryData(){
    final List<Map<String,Object>> sumarry = [];

    for(var i = 0 ; i < chosenAnswers.length ; i++){
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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You ansered X out of Y questions correctly"),
            SizedBox(height: 30,),
            Text("List of answers and questions"),
            SizedBox(height: 30,),
            TextButton(onPressed: (){}, child: Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }

}