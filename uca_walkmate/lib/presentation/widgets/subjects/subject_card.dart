import 'package:flutter/material.dart';
import 'package:uca_walkmate/presentation/widgets/shared/badge_widget.dart';

class SubjectCard extends StatelessWidget {
  final String name;
  final String image;
  final String location;
  final String schedule;
  final String status;

  SubjectCard({
    super.key, 
    required this.name,
    required this.image,
    required this.location,
    required this.schedule, 
    required this.status
  });

  final Map<String, String> daysMap = {
    'L': 'Lunes',
    'M': 'Martes',
    'X': 'Miércoles',
    'J': 'Jueves',
    'V': 'Viernes',
    'S': 'Sábado',
    'D': 'Domingo',
  };

  String convertDaysString(String daysString) {
    List<String> days = [];

    for (int i = 0; i < daysString.length; i++) {
      String char = daysString[i];
      if (char != '-') {
        days.add(daysMap[char] ?? '');
      }
    }

    if (days.isEmpty) {
      return '';
    } else if (days.length == 1) {
      return days.first;
    } else {
      return '${days.sublist(0, days.length - 1).join(', ')} y ${days.last}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    String scheduleText = convertDaysString(schedule);

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 3.0,
      child: Column(
        children: [
          Stack(
            children: [
              
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),

              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.more_vert), 
                    onPressed: () {},
                  ),
                )
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.titleSmall),
                    BadgeComponent(status: status,),
                  ],
                ),
                
                const SizedBox(height: 20),

                Row(
                  children: [
                    const Icon(Icons.location_on_rounded),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        location,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, 
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.access_time_rounded),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        scheduleText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, 
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.chevron_right, color: colors.tertiary),
                    iconAlignment: IconAlignment.end,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      
                    }, 
                    label: Text('Ir', style: TextStyle(color: colors.tertiary),),
                  ),
                )

              ],
            ),
          ),

        ] 
      ),
    );
  }
}