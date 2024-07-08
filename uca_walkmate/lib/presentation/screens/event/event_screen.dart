import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:uca_walkmate/presentation/providers/event_provider.dart';
import 'package:uca_walkmate/presentation/widgets/event/event_card.dart';

class EventScreen extends StatelessWidget {
  static const String routeName = 'event';
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: _EventView());
  }
}

class _EventView extends ConsumerWidget {
  const _EventView();

  String changingDate(String date) {

     initializeDateFormatting();
    DateTime dateTime = DateTime.parse(date);

    return DateFormat('EEEE d \'de\' MMMM, yyyy', 'es_ES').format(dateTime);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventProvider).events;

    return SingleChildScrollView(
      child: Column(children: [
        //EventCard(name: 'Conia 2024', image: 'assets/images/card_image-2.jpg', location: 'Auditorio Elba y Celina', date: 'Lunes 10 de junio', description: 'Conferencias para todos los niveles de Ingenería'),
        ...events.map(
          (e) => EventCard(
              name: e.name,
              image: 'assets/images/card_image-2.jpg',
              location: e.location.name,
              date: changingDate(e.date)[0].toUpperCase() + changingDate(e.date).substring(1),
              description: e.description),
        ),
        const SizedBox(
          height: 60,
        )
      ]),
    );
  }
}
