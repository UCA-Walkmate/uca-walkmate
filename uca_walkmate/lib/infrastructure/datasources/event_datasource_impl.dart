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
