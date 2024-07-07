import 'package:uca_walkmate/domain/domain.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectDatasource _datasource;

  SubjectRepositoryImpl(this._datasource);
 
  @override
  Future<void> addSubject(Subject subject) {
    return _datasource.addSubject(subject);
  }

  @override
  Future<List<Subject>> getSubjectsByUserId(int userId) {
    return _datasource.getSubjectsByUserId(userId);
  }

}