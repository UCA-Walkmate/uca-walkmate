import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/presentation/providers/subject_provider.dart';

class SubjectDeletePopup extends ConsumerWidget {
  final int id;
  const SubjectDeletePopup({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        showMenu(
          context: context,
          position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
          items: [
            const PopupMenuItem<String>(
              child: Text('Eliminar materia'),
            ),
          ],
        ).then((String? item) {
          
            ref.read(subjectProvider.notifier).deleteSubjectById(id);
          
        });
      },
    );
  }
}
