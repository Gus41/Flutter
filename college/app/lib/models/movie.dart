import 'package:app/models/genre.dart';
import 'package:uuid/uuid.dart';

class Movie {
  Movie({required this.director, required this.name, required this.genre});
  
  final String name;
  final String id = Uuid().v4();
  final String director;
  final Genre genre;

}