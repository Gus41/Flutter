import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
          child: Text("No places added yet",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)));
    }

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            subtitle: Text(
                '${places[index].location.latitude} - ${places[index].location.longitude}',
                   style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)
                ),
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return PlaceDetailScreen(place: places[index]);
              }));
            },
            title: Text(places[index].title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
          );
        });
  }
}
