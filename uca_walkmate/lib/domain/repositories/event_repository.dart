import 'package:uca_walkmate/domain/entities/event.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents();
}
