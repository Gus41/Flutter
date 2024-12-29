import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{

  const StyledText (this.text, {super.key});  
  final String text;


  @override
  Widget build(context){
    const Color textColor = Color.fromARGB(255, 255, 255, 255);

    return Text(
            text,
            style: const TextStyle(color: textColor, fontSize: 28),
          );
  }
}