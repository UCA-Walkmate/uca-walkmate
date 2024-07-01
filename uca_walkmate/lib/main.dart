import 'package:flutter/material.dart';
import 'package:uca_walkmate/config/router/app_router.dart';
import 'package:uca_walkmate/config/theme/app_theme.dart';
// import 'package:uca_walkmate/presentation/screens/map/full_screen_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Mapa UCA',
      theme: AppTheme().getTheme(),
      // home: const FullScreenMap(),
    );
  }
}


