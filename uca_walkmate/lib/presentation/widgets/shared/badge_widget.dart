import 'package:flutter/material.dart';

class BadgeComponent extends StatelessWidget {
  final String status;

  const BadgeComponent({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final statusMap = {
      'ENC': {
        'value': 'En curso',
        'bgColor': 0xFFD9D9D9,
        'textColor': 0xFF1C222E,
      },
      'FIN': {
        'value': 'Finalizada',
        'bgColor': 0xFFfBDDDD,
        'textColor': 0xFFEA5455,
      },
    };

    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Color(statusMap[status]!['bgColor'] as int), // Light grey background color
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Text(
        statusMap[status]!['value'].toString(),
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: Color(statusMap[status]!['textColor'] as int)),
      ),
    );
  }
}

