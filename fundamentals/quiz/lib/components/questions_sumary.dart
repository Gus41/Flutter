import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSumary extends StatelessWidget {
  const QuestionsSumary({super.key, required this.data});

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: data.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: e['answered'] == e['correct']
                          ? Colors.blue
                          : Colors.pink,
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(((e['index'] as int) + 1).toString(),style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e['question'] as String,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(e['answered'] as String,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 198, 8, 72)
                      ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(e['correct'] as String,
                      style: TextStyle(
                        color:const Color.fromARGB(255, 4, 106, 7)
                      ),),
                      SizedBox(height: 20,)
                    ],
                    
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
