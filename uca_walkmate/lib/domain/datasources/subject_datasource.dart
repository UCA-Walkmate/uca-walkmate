import 'package:uca_walkmate/domain/domain.dart';

abstract class SubjectDatasource {
  Future<List<Subject>> getSubjectsByUserId(int userId);
  Future<void> addSubject(Subject subject);
}
