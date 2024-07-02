import 'package:go_router/go_router.dart';
import 'package:uca_walkmate/presentation/screens/event/event_screen.dart';
import 'package:uca_walkmate/presentation/screens/home/home_screen.dart';
import 'package:uca_walkmate/presentation/screens/login/login_screen.dart';
import 'package:uca_walkmate/presentation/screens/signup/sign_up_screen.dart';
import 'package:uca_walkmate/presentation/screens/subject/subject_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    name: LoginScreen.routeName,
    path: '/',
    // builder: (context, state) => const LoginScreen(),
    // builder: (context, state) => const FullScreenMap(),
    builder: (context, state) => const HomeScreen(),
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
  GoRoute(
    name: SignUpScreen.routeName,
    path: '/signup',
    builder: (context, state) => const SignUpScreen(),
  ),
]);
