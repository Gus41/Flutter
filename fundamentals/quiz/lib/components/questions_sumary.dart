import 'package:flutter/material.dart';

class QuestionsSumary extends StatelessWidget {

  const QuestionsSumary({super.key, required this.data});

  final List<Map<String,Object>> data;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: data.map((e){
        return Row(
          children: [
            Text((( e['index'] as int) + 1).toString()),
            Column(
              children: [
                Text(e['question'] as String),
                const SizedBox(height: 5,),
                Text(e['answered'] as String),
                const SizedBox(height: 5,),
                Text(e['correct'] as String),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}