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