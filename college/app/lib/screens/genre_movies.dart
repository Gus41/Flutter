import 'package:app/models/genre.dart';
import 'package:app/models/movie.dart';
import 'package:app/providers/movies_provider.dart';
import 'package:app/screens/movie_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({super.key, required this.genre});

  final Genre genre;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final all = ref.watch(moviesProvider);
    final moviesByGenre = [];
    for (Movie m in all) {
      if (m.genre.id == genre.id) {
        moviesByGenre.add(m);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(genre.name)),
      body: ListView.builder(
        itemCount: moviesByGenre.length,
        itemBuilder: (ctx, index) {
          final movie = moviesByGenre[index];

          return ListTile(
            title: Text(movie.name),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MovieForm(movie: movie),
                ),
              );
            },
          );
        },
      ),
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
