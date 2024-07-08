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
  Future<void> register (String email, String name, String password,
      String confirmPassword) async {
    try {
       final response = await dio
          .post('/auth/sign-up', data: {'email': email, 'password': password, 'name': name, 'confirmPassword': confirmPassword});

      // final user = UserMapper.userJsonToEntity(response.data);
      print(response.data);
      // return user;
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
