import 'package:uca_walkmate/domain/domain.dart';

class Location {
  final int id;
  final Geom geom;
  final int objectId;
  final int idAux;
  final String name;
  final Category category;

  Location({
    required this.id,
    required this.geom,
    required this.objectId,
    required this.idAux,
    required this.name,
    required this.category,
  });
}

class Geom {
  final String type;
  final List<double> coordinates;

  Geom({
    required this.type,
    required this.coordinates,
  });

  factory Geom.fromJson(Map<String, dynamic> json) => Geom(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );
}
