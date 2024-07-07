import 'package:uca_walkmate/domain/entities/location.dart';
import 'package:uca_walkmate/domain/entities/subject.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getSubjectsByUserId(int userId);
  Future<void> addSubject(String name, int locationId, String schedule, String status, int image);
  Future<List<Location>> getLocations();
} 