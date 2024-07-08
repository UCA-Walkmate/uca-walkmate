// Copyright 2024 UCA Walkmate
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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

