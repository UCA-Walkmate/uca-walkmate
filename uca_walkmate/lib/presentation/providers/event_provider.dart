import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/domain/entities/event.dart';
import 'package:uca_walkmate/domain/repositories/event_repository.dart';
import 'package:uca_walkmate/infrastructure/datasources/event_datasource_impl.dart';
import 'package:uca_walkmate/infrastructure/repositories/event_repository_impl.dart';
import 'package:uca_walkmate/presentation/providers/auth_provider.dart';

final eventProvider = StateNotifierProvider<EventNotifier, EventState>((ref) {
  final user = ref.watch(authProvider).user;

  final eventRepository = EventRepositoryImpl(
    EventDatasourceImpl(accessToken: user!.token),
  );

  return EventNotifier(
    eventRepository: eventRepository,
    user: user,
  );
});

class EventNotifier extends StateNotifier<EventState> {
  final EventRepository eventRepository;
  final User user;

  EventNotifier({
    required this.eventRepository,
    required this.user,
  }) : super(EventState()) {
    getEvents();
  }

  Future<void> getEvents() async {
    state = state.copyWith(isLoading: true);

    final events = await eventRepository.getEvents();

    state = state.copyWith(
      events: events,
      isLoading: false,
    );
  }
}

class EventState {
  final List<Event> events;
  final bool isLoading;

  EventState({
    this.events = const [],
    this.isLoading = false,
  });

  EventState copyWith({
    List<Event>? events,
    bool? isLoading,
  }) {
    return EventState(
      events: events ?? this.events,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
