import 'package:app/data/all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/models/genre.dart';


class GenresNotifier extends StateNotifier<List<Genre>> {
  GenresNotifier() : super(genres);

  void addGenre(Genre newGenre) {
    state = [...state, newGenre];
  }

  void updateGenre(String id, Genre updatedGenre) {
    state = state.map((genre) => genre.id == id ? updatedGenre : genre).toList();
  }

  void deleteGenre(String id) {
    state = state.where((genre) => genre.id != id).toList();
  }
}

final genresProvider = StateNotifierProvider<GenresNotifier, List<Genre>>((ref) {
  return GenresNotifier();
});
