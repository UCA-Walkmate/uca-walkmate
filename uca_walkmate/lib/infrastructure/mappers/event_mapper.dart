import 'package:uca_walkmate/domain/entities/event.dart';
import 'package:uca_walkmate/infrastructure/mappers/location_mapper.dart';

class EventMapper {
  static Event eventJsonToEntity(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        date: json["date"],
        description: json["description"],
        location: LocationMapper.locationJsonToLocation(json["location"]),
      );
}
