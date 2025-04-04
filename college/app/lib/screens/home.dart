import 'package:app/providers/genre_provider.dart';
import 'package:app/screens/genre_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(genresProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Gêneros")),
      body: genres.isNotEmpty
          ? ListView.builder(
              itemCount: genres.length,
              itemBuilder: (ctx, index) {
                final genre = genres[index];

                return ListTile(
                  title: Text(genre.name),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GenreScreen(genre: genre),
                      ),
                    );
                  },
                );
              },
            )
          : const Center(child: Text("No items yet")),
    );
  }
}
