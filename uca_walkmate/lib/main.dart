import 'package:flutter/material.dart';
import 'package:uca_walkmate/config/theme/app_theme.dart';
import 'package:uca_walkmate/presentation/map/full_screen_map.dart';
import 'package:uca_walkmate/presentation/screens/subject_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mapa UCA',
      theme: AppTheme(selectedColor: 0).theme(),
      home: const SubjectFormScreen(),
     // home: const FullScreenMap(),
    );
  }}



