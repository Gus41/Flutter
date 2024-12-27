import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{

  const StyledText ({super.key});

  @override
  Widget build(context){
    const Color textColor = Colors.white38;

    return Text(
            'Hello World 4',
            style: TextStyle(color: textColor, fontSize: 28),
          );
  }
}