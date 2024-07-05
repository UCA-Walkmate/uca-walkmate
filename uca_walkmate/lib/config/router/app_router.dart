import 'package:go_router/go_router.dart';
import 'package:uca_walkmate/presentation/screens/event/event_screen.dart';
import 'package:uca_walkmate/presentation/screens/map/full_screen_map.dart';
import 'package:uca_walkmate/presentation/screens/subject/subject_screen.dart';
import 'package:uca_walkmate/presentation/screens/subject_form_screen.dart';

final AppRouter = GoRouter(routes: [
  GoRoute(
    name: SubjectFormScreen.routeName,
    path: '/',
    builder: (context, state) => const SubjectFormScreen(),
  ),
  GoRoute(
    name: SubjectScreen.routeName,
    path: '/subject',
    builder: (context, state) => const SubjectScreen(),
  ),
  GoRoute(
    name: EventScreen.routeName,
    path: '/events',
    builder: (context, state) => const EventScreen(),
  ),
]);
