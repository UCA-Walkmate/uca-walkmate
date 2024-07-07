import 'package:uca_walkmate/domain/entities/subject.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getSubjectsByUserId(int userId);
  Future<void> addSubject(Subject subject);
} 