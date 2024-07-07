import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/mappers/category_mapper.dart';

class LocationMapper {
  
  static Location locationJsonToLocation(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      geom: Geom.fromJson(json['geom']),
      objectId: json['objectId'],
      idAux: json['idAux'],
      name: json['name'],
      category: CategoryMapper.categoryJsonToCategory(json['category']),
    );
  }

}