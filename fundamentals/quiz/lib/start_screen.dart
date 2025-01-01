import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.start, {super.key});

  final void Function() start;

  @override
  Widget build(BuildContext context) {
    

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Opacity(
          //      opacity: 0.5,
          //      child: Image.asset(
          //        'assets/images/quiz-logo.png',
          //        width: 300,
          //      )),

          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(112, 255, 255, 255), //opacity
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 36,
          ),
          OutlinedButton.icon(
              onPressed: start,
              style: OutlinedButton.styleFrom(
                iconColor: Colors.white,
                foregroundColor: Colors.white,
              ),
              icon: Icon(Icons.arrow_forward),
              label: const Text("Start quiz"))
        ],
      ),
    );
  }
}
