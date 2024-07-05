import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uca_walkmate/presentation/screens/auth/check_auth_status_screen.dart';
import 'package:uca_walkmate/presentation/screens/event/event_screen.dart';
import 'package:uca_walkmate/presentation/screens/home/home_screen.dart';
import 'package:uca_walkmate/presentation/screens/login/login_screen.dart';
import 'package:uca_walkmate/presentation/screens/signup/sign_up_screen.dart';
import 'package:uca_walkmate/presentation/screens/subject/subject_screen.dart';
import 'package:uca_walkmate/presentation/screens/subject_form_screen.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/check-auth-status',
    routes: [
      GoRoute(
        name: CheckAuthStatusScreen.routeName,
        path: '/check-auth-status',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: '/login',
        builder: (context, state) => const LoginScreen(),
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
    ],
  );
});