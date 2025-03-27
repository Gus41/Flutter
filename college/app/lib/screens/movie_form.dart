import 'package:app/data/all.dart';
import 'package:app/models/movie.dart';
import 'package:app/models/genre.dart';
import 'package:app/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieForm extends ConsumerStatefulWidget {
  const MovieForm({super.key, this.movie});

  final Movie? movie;

  @override
  ConsumerState<MovieForm> createState() => _MovieFormState();
}

class _MovieFormState extends ConsumerState<MovieForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _directorController;
  Genre? _selectedGenre;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.movie?.name ?? '');
    _directorController = TextEditingController(text: widget.movie?.director ?? '');
    _selectedGenre = widget.movie?.genre;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _directorController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedGenre == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Selecione um gênero!")),
        );
        return;
      }

      final newMovie = Movie(
        name: _nameController.text,
        director: _directorController.text,
        genre: _selectedGenre!,
      );

      final moviesNotifier = ref.read(moviesProvider.notifier);

      if (widget.movie == null) {
        moviesNotifier.addMovie(newMovie);
      } else {
        moviesNotifier.updateMovie(widget.movie!.id, newMovie);
      }

      Navigator.pop(context, newMovie);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie == null ? "Adicionar Filme" : "Editar Filme"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nome do Filme"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o nome do filme";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _directorController,
                decoration: const InputDecoration(labelText: "Diretor"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o nome do diretor";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<Genre>(
                value: _selectedGenre,
                items: genres.map((genre) {
                  return DropdownMenuItem(
                    value: genre,
                    child: Text(genre.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGenre = value;
                  });
                },
                decoration: const InputDecoration(labelText: "Gênero"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.movie == null ? "Adicionar" : "Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
