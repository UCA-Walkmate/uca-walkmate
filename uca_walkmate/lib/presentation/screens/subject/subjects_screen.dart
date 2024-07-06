import 'package:flutter/material.dart';

class SubjectsScreen extends StatelessWidget {
  static const String routeName = 'subject';
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              'Subject Screen',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
