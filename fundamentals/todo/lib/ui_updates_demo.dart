import 'package:flutter/material.dart';
import 'package:flutter_internals/demo_button.dart';


class UiUpdatesDemo extends StatelessWidget {
  const UiUpdatesDemo({super.key});



  @override
  Widget build(BuildContext context) {
    print('UIUpdatesDemo BUILD called');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Do you understand how Flutter updates UIs?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(child: DemoButton())
          ],
        ),
      ),
    );
  }
}
