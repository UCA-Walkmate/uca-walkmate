import 'package:dio/dio.dart';
import 'package:uca_walkmate/config/constants/environment.dart';
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/mappers/subject_mapper.dart';

class SubjectDatasourceImpl implements SubjectDatasource {
  late final Dio dio;
  final String accessToken;

  SubjectDatasourceImpl({
    required this.accessToken
  }) : dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      headers: {
        'Authorization': 'Bearer $accessToken',
      }
    )
  );

  @override
  Future<void> addSubject(Subject subject) {
    throw UnimplementedError();
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
}