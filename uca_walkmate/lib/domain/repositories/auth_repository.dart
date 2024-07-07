import 'package:uca_walkmate/domain/domain.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<void> register(
      String email, String name, String password, String confirmPassword);
  Future<User> checkAuthStatus(String token);
}
