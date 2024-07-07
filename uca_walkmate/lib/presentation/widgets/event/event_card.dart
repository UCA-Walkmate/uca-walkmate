import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {

  final String name;
  final String image;
  final String location;
  final String date;
  final String description;

  const EventCard(
      {
      super.key,
      required this.name,
      required this.image,
      required this.location,
      required this.date,
      required this.description});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(name, style: Theme.of(context).textTheme.titleSmall),
               
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
                    const Icon(Icons.calendar_today_sharp),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        date,
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
                    const Icon(Icons.push_pin_sharp),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        description,
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
