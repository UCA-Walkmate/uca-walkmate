import 'package:flutter/material.dart';
import 'package:uca_walkmate/presentation/widgets/menu/subject_delete_popup.dart';
import 'package:uca_walkmate/presentation/widgets/shared/badge_widget.dart';

class SubjectCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final String location;
  final String schedule;
  final String status;

  SubjectCard(
      {super.key,
      required this.id,
      required this.name,
      required this.image,
      required this.location,
      required this.schedule,
      required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 3.0,
      child: Column(children: [
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
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20))),
                  child: SubjectDeletePopup(id: id),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(name,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  BadgeComponent(
                    status: status,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Icon(Icons.location_on_rounded),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(location,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Row(
              //   children: [
              //     const Icon(Icons.access_time_rounded),
              //     const SizedBox(width: 10),
              //     Expanded(
              //       child: Text(
              //         scheduleText,
              //         maxLines: 2,
              //         overflow: TextOverflow.ellipsis,
              //         style: Theme.of(context).textTheme.bodyMedium
              //       ),
              //     ),
              //   ],
              // ),

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
                  onPressed: () {},
                  label: Text(
                    'Ir',
                    style: TextStyle(color: colors.tertiary),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
