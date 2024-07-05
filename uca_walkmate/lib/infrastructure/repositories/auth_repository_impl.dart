import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/infrastructure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl({
    AuthDatasource? authDatasource
  }) : _authDatasource = authDatasource ?? AuthDatasourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return _authDatasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return _authDatasource.login(email, password);
  }

  @override
  Future<User> register(String email, String password) {
    return _authDatasource.register(email, password);
  }

}