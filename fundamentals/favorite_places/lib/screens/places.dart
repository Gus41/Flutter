import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Places extends ConsumerWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Place> places = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return const AddPlaceScreen();
                }));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: PlacesList(places: places),
    );
  }
}
