import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/mappers/role_mapper.dart';

class UserMapper {

  static User userJsonToEntity(Map<String, dynamic> json) => User(
    id: json['id'], 
    name: json['name'], 
    email: json['email'], 
    password: json['password'], 
    role: RoleMapper.roleJsonToEntity(json['role']), 
    token: json['token']
  );

}