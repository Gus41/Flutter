import 'package:app/models/genre.dart';
import 'package:app/models/movie.dart';


final List<Genre> genres = [
  Genre(name: "Ação"),
  Genre(name: "Comédia"),
  Genre(name: "Drama"),
  Genre(name: "Ficção Científica"),
];

final List<Movie> movies = [
  Movie(
    name: "Mad Max: Estrada da Fúria",
    director: "George Miller",
    genre: genres[0],
  ),
  Movie(
    name: "O Máskara",
    director: "Chuck Russell",
    genre: genres[1],
  ),
  Movie(
    name: "Clube da Luta",
    director: "David Fincher",
    genre: genres[2], // Drama
  ),
  Movie(
    name: "Interestelar",
    director: "Christopher Nolan",
    genre: genres[3], // Ficção Científica
  ),
  Movie(
    name: "Vingadores: Ultimato",
    director: "Anthony e Joe Russo",
    genre: genres[0], // Ação
  ),
  Movie(
    name: "Superbad",
    director: "Greg Mottola",
    genre: genres[1], // Comédia
  ),
];
