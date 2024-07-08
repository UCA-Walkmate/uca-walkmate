import 'package:uca_walkmate/domain/domain.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectDatasource _datasource;

  SubjectRepositoryImpl(this._datasource);
 
  @override
  Future<void> addSubject(String name, int locationId, String schedule, String status, int image) {
    return _datasource.addSubject(name, locationId, schedule, status, image);
  }

  @override
  Future<List<Subject>> getSubjectsByUserId(int userId) {
    return _datasource.getSubjectsByUserId(userId);
  }
  
  @override
  Future<List<Location>> getLocations() {
    return _datasource.getLocations();
  }
  
  @override
  Future<void> deleteSubjectById(int subjectId) {
    return _datasource.deleteSubjectById(subjectId);
  }

}