import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/presentation/providers/subject_provider.dart';

class SubjectDeletePopup extends ConsumerWidget {
  final int id;
  const SubjectDeletePopup({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (String result) {
        if (result == 'delete') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirmación'),
                content: const Text(
                    '¿Estás seguro que deseas eliminar esta materia?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(subjectProvider.notifier).deleteSubjectById(id);
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Eliminar'),
                  ),
                ],
              );
            },
          );
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'delete',
          child: Text('Eliminar materia'),
        ),
      ],
    );
  }
}
