import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';


class GradientContainer extends StatelessWidget{
  //constructor
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;
  
  @override
  Widget build(context){
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: StyledText("Text parameterized")
        ),
      );
  }
}

