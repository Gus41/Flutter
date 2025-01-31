import 'dart:io';

import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPLaceScreen();
  }
}

class _AddPLaceScreen extends ConsumerState<AddPlaceScreen> {
  final _titleControler = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    _titleControler.dispose();
    super.dispose();
  }

  void _savePlace() {
    final enteredText = _titleControler.text;

    if (enteredText.isEmpty || _selectedImage == null) {
      print("Error in validation");
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredText, _selectedImage!);

    Navigator.of(context).pop();
  }

  void onSelectImage(File img) {
    _selectedImage = img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add a new place"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: _titleControler,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 16,
            ),
            ImageInput(
              onSelectImage: onSelectImage,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text("Add Place"))
          ]),
        ));
  }
}
