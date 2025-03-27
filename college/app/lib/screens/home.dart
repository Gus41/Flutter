import 'package:app/models/movie.dart';
import 'package:app/screens/genre_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/models/genre.dart';
import 'package:app/data/all.dart';

List<Movie> getMoviesByGender(Genre genre) {
  return movies.where((m) => m.genre.id == genre.id).toList();
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: genres.length,
      itemBuilder: (ctx, index) {
        final genre = genres[index];

        return ListTile(
          title: Text(genre.name),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => GenreScreen(genre: genre)));
          },
        );
      },
    );
  }
}
