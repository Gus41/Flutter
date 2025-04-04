import 'package:app/data/all.dart';
import 'package:app/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesNotifier extends StateNotifier<List<Movie>> {
  MoviesNotifier() : super(movies);

  void addMovie(Movie newMovie) {
    state = [...state, newMovie];
  }

  void updateMovie(String id, Movie updatedMovie) {
    state = state.map((movie) => movie.id == id ? updatedMovie : movie).toList();
  }

  void deleteMovie(String id) {
    state = state.where((movie) => movie.id != id).toList();
  }
}

final moviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  return MoviesNotifier();
});
