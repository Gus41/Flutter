import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: const Color.fromARGB(255, 4, 85, 151),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Navigator Screen 3"),
          ),
        ],
      )),
    );
  }
}
