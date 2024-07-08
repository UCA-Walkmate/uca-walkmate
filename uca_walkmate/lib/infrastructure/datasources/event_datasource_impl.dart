
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
import 'package:uca_walkmate/domain/datasources/event_datasource.dart';
import 'package:uca_walkmate/domain/entities/event.dart';
import 'package:uca_walkmate/infrastructure/mappers/event_mapper.dart';

class EventDatasourceImpl implements EventDatasource {
  late final Dio dio;
  final String accessToken;

  EventDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(baseUrl: Environment.apiUrl, headers: {
          'Authorization': 'Bearer $accessToken',
        }));

 @override
  Future<List<Event>> getEvents() async {
    
    try {
      final response = await dio.get<List>('/events');
      
      final List<Event> events = [];

      for (final event in response.data ?? []) {
        events.add(EventMapper.eventJsonToEntity(event));
      }

      return events;

    } catch (e) {
      throw Exception('An error occurred');
    }
  
  }




}
