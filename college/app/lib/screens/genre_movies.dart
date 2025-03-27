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
    );
  }
}
