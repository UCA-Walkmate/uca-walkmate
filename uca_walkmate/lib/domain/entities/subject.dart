import 'package:uca_walkmate/domain/domain.dart';

class Subject {
  final int id;
  final String name;
  final String schedule;
  final int image;
  final String status;
  final Location location;

  Subject({
    required this.id,
    required this.name,
    required this.schedule,
    required this.image,
    required this.status,
    required this.location,
  });
}