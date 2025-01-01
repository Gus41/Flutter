import 'package:flutter/material.dart';
import 'package:quiz/components/answer_button.dart';



class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {

  void onClick(){
    print("CLick");
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Question",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          SizedBox(
            height: 26,
          ),
          AnswerButton("Anser one",onClick)          
        ],
    ));
  }
}
