import 'package:uca_walkmate/domain/domain.dart';

abstract class SubjectDatasource {
  Future<List<Subject>> getSubjectsByUserId(int userId);
  Future<void> addSubject(String name, int locationId, String schedule, String status, int image);
  Future<List<Location>> getLocations();
}
