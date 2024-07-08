// Copyright 2024 UCA Walkmate
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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
