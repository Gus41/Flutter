import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';


class GradientContainer extends StatelessWidget{
  //constructor
  const GradientContainer({super.key});
  
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
            colors: [Colors.red, Colors.yellow],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: StyledText()
        ),
      );
  }
}

