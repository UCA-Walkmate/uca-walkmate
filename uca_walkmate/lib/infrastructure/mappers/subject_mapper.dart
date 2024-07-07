
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/mappers/location_mapper.dart';

class SubjectMapper {

  static Subject subjectJsonToSubject(Map<String, dynamic> json) => Subject(
    id: json["id"],
    name: json["name"],
    schedule: json["schedule"],
    image: json["image"],
    status: json["status"],
    location: LocationMapper.locationJsonToLocation(json["location"]),
  );

}