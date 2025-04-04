import 'package:app/models/genre.dart';
import 'package:app/providers/genre_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenreForm extends ConsumerStatefulWidget {
  const GenreForm({super.key, this.genre});

  final Genre? genre;

  @override
  ConsumerState<GenreForm> createState() => _GenreFormState();
}

class _GenreFormState extends ConsumerState<GenreForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.genre?.name ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final genresNotifier = ref.read(genresProvider.notifier);
      final newGenre = Genre(name: _nameController.text);

      if (widget.genre == null) {
        genresNotifier.addGenre(newGenre);
      } else {
        genresNotifier.updateGenre(widget.genre!.id, newGenre);
      }

      Navigator.pop(context, newGenre);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genre == null ? "Adicionar Gênero" : "Editar Gênero"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nome do Gênero"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o nome do gênero";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.genre == null ? "Adicionar" : "Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
