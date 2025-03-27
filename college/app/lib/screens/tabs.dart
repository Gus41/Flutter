import 'package:app/screens/home.dart';
import 'package:app/screens/movie_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenRouter extends ConsumerStatefulWidget {
  const ScreenRouter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RouterState();
  }
}

class _RouterState extends ConsumerState<ScreenRouter> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //final user = ref.watch(userProvider);

    final List<Widget> pages = [
      const HomeScreen(),
      const Center(
        child: Text("..."),
      ),
      const Center(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEDEDED),
      ),
      body: pages[currentPageIndex],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => MovieForm(),
              ),
            );
          },
          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
          shape: const CircleBorder(),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          )),
    );
  }
}
