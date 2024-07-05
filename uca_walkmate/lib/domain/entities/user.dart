import 'package:uca_walkmate/domain/domain.dart';

class User {
  final int id;
  final String name;
  final String email;
  final Role role;
  final String token;

  User({
    required this.id,
    required this.name, 
    required this.email, 
    required this.role, 
    required this.token
  });

  bool get isAdmin => role.name == 'admin';

}