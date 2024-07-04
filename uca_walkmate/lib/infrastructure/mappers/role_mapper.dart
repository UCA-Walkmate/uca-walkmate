
import 'package:uca_walkmate/domain/domain.dart';

class RoleMapper {

  static Role roleJsonToEntity(Map<String, dynamic> json) => Role(
    id: json['id'], 
    name: json['name']
  );

}