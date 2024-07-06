import 'package:flutter/material.dart';
import 'package:uca_walkmate/presentation/widgets/shared/badge_widget.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
                  'assets/images/card_image-1.jpg',
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
                    Text('Cálculo Diferencial', style: Theme.of(context).textTheme.titleSmall),
                    const BadgeComponent(),
                  ],
                ),
                
                const SizedBox(height: 20),

                Row(
                  children: [
                    const Icon(Icons.location_on_rounded),
                    const SizedBox(width: 10),
                    Text('Edificio Aulas "D"', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.access_time_rounded),
                    const SizedBox(width: 10),
                    Text('Lunes y Miércoles', style: Theme.of(context).textTheme.bodyMedium),
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