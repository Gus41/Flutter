import 'package:flutter/material.dart';
import 'package:first/screens/screen2.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.green,
      ),
      body: Container(
          color: Colors.greenAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Navigator Screen 3"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return Screen2();
                    }));
                  },
                  child: Text("Push navigation 2"))
            ],
          )),
    );
  }
}
