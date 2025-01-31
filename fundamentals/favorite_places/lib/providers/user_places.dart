import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDb() async {
  final databasePath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(databasePath, 'place.db'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, image TEXT, latitude TEXT, longitude TEXT)');
  }, version: 1);

  return db;
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  Future<void> loadData() async {
    final db = await _getDb();

    final data = await db.query('places');
    final places = data.map((row) {
      return Place(
          id: row['id'] as String,
          title: row['title'] as String,
          image: File(row['image'] as String),
          location: PlaceLocation(
              latitude: row['latitude'] as String,
              longitude: row['longitude'] as String));
    }).toList();

    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/${fileName}');

    final newPlace =
        Place(title: title, image: copiedImage, location: location);

    final db = await _getDb();
    db.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': copiedImage.path,
      'latitude': newPlace.location.latitude,
      'longitude': newPlace.location.longitude
    });

    state = [...state, newPlace];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) {
  return UserPlacesNotifier();
});
