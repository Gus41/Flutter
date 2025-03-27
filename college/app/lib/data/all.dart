import 'package:uuid/uuid.dart';
import 'package:app/models/genre.dart';
import 'package:app/models/movie.dart';

final Uuid uuid = Uuid();

final Genre action = Genre(name: "Ação");
final Genre comedy = Genre(name: "Comédia");
final Genre drama = Genre(name: "Drama");
final Genre sciFi = Genre(name: "Ficção Científica");

List<Genre> genres = [
  action,
  comedy,
  drama,
  sciFi
];

final List<Movie> movies = [
  Movie(name: "Mad Max: Estrada da Fúria", director: "George Miller", genre: genres[0]),
  Movie(name: "O Máskara", director: "Chuck Russell", genre: genres[1]),
  Movie(name: "Clube da Luta", director: "David Fincher", genre: genres[2]),
  Movie(name: "Interestelar", director: "Christopher Nolan", genre: genres[3]),
];
