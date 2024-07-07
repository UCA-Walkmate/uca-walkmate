import 'package:uca_walkmate/domain/datasources/event_datasource.dart';
import 'package:uca_walkmate/domain/entities/event.dart';
import 'package:uca_walkmate/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDatasource _datasource;

  EventRepositoryImpl(this._datasource);
 
  @override
  Future<List<Event>> getEvents() {
    return _datasource.getEvents();
  }

}