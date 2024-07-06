import 'package:flutter/material.dart';

class BadgeComponent extends StatelessWidget {
  const BadgeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Light grey background color
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Text(
        'En curso',
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}