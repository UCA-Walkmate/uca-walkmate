import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/presentation/providers/subject_provider.dart';
import 'package:uca_walkmate/presentation/widgets/subjects/subject_card.dart';

class SubjectsScreen extends StatelessWidget {
  static const String routeName = 'subject';
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: _SubjectsView()
    );
      
  }
}

class _SubjectsView extends ConsumerWidget {
  const _SubjectsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjState = ref.watch(subjectProvider);
    final colors = Theme.of(context).colorScheme;

    print(subjState.subjects);

    return SingleChildScrollView(
      child: subjState.isLoading? const Center(child: CircularProgressIndicator(),) 
      
      :
      
      Column(
        children: [
          ...subjState.subjects.map((subject) => SubjectCard(
            name: subject.name, 
            image: 'assets/images/card_image-${subject.image}.jpg',
            location: subject.location.name,
            schedule: subject.schedule,
            status: subject.status,
          )),
          // const SubjectCard(),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
                icon: Icon(Icons.add, color: colors.primary),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4D5DA),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
              
              }, 
              label: Text('Añadir nueva materia', style: TextStyle(color: colors.primary, fontWeight: FontWeight.w700),),
            ),
          ),
          
          const SizedBox(height: 75),

        ],
      ),      
    );
  }
}
