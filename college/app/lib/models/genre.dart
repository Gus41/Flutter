import 'package:uuid/uuid.dart';

class Genre {
  Genre({required this.name});

  final String id = Uuid().v4();
  final String name;
}