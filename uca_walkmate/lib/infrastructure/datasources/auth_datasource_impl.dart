import 'package:dio/dio.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/infrastructure.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/profile',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final User user = User(
        id: response.data['id'],
        name: response.data['name'],
        email: response.data['email'],
        role: RoleMapper.roleJsonToEntity(response.data['role']),
        token: token,
      );

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomException('Invalid token');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});

      final user = UserMapper.userJsonToEntity(response.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomException(e.response?.data['message']);
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomException('Connection Timeout');
      }

      throw Exception('An error occurred');
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  @override
  Future<User> register(String email, String name, String password,
      String confirmPassword) async {
    try {
      final response = await dio
          .post('/auth/sign-up', data: {'email': email, 'password': password});

      final user = UserMapper.userJsonToEntity(response.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomException(e.response?.data['message']);
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomException('Connection Timeout');
      }

      throw Exception('An error occurred');
    } catch (e) {
      throw Exception('An error occurred');
    }
  }
}
