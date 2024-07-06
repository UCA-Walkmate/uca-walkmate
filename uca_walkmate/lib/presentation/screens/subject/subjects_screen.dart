import 'package:flutter/material.dart';
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

class _SubjectsView extends StatelessWidget {
  const _SubjectsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          // TODO: Implementar el listado de materias
          const SubjectCard(),

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
          )

        ],
      ),      
    );
  }
}
