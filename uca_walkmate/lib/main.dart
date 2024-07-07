import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/config/router/app_router.dart';
import 'package:uca_walkmate/config/theme/app_theme.dart';
// import 'package:uca_walkmate/presentation/screens/map/full_screen_map.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    const ProviderScope(
      child: MyApp() 
    )    
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'UCA Walkmate',
      theme: AppTheme().getTheme(),
      // home: const FullScreenMap(),
    );
  }}



