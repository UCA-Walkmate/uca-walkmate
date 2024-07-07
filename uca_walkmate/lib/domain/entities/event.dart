import 'package:uca_walkmate/domain/entities/location.dart';

class Event {
  final int id;
  final String name;
  final String description;
  final String date;
  final Location location;

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.description,
    required this.location,
  });
}
