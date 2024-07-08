import 'package:dio/dio.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/mappers/location_mapper.dart';
import 'package:uca_walkmate/infrastructure/mappers/subject_mapper.dart';

class SubjectDatasourceImpl implements SubjectDatasource {
  late final Dio dio;
  final String accessToken;
  final int userId;

  SubjectDatasourceImpl({
    required this.accessToken,
    required this.userId,
  }) : dio = Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
          'Authorization': 'Bearer $accessToken',
        }));

  @override
  Future<void> addSubject(String name, int locationId, String schedule,
      String status, int image) async {
    try {
      await dio.post('/subjects', data: {
        'name': name,
        'userId': userId,
        'locationId': locationId,
        'schedule': schedule,
        'status': status,
        'image': image,
      });
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  @override
  Future<List<Subject>> getSubjectsByUserId(int userId) async {
    try {
      final response = await dio.get<List>('/subjects/user/$userId');

      final List<Subject> subjects = [];

      for (final subject in response.data ?? []) {
        subjects.add(SubjectMapper.subjectJsonToSubject(subject));
      }

      return subjects;
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  @override
  Future<List<Location>> getLocations() async {
    try {
      final response = await dio.get<List>('/locations');

      final List<Location> locations = [];

      for (final location in response.data ?? []) {
        locations.add(LocationMapper.locationJsonToLocation(location));
      }

      return locations;
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  @override
  Future<void> deleteSubjectById(int subjectId) async {
    try {
      final response = await dio.delete('/subjects/$subjectId');
      print(response);
    } catch (e) {
      throw Exception('An error occurred');
    }
  }
}
