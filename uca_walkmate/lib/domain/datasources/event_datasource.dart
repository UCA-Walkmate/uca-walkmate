import 'package:uca_walkmate/domain/entities/event.dart';

abstract class EventDatasource {
  Future<List<Event>> getEvents();
}
