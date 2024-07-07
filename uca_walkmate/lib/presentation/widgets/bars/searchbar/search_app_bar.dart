import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/presentation/providers/auth_provider.dart';

class SearchAppBar extends ConsumerWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: colors.onPrimary,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              style: TextStyle(color: const Color(0XFFFDFFE2).withOpacity(0.4)),
              decoration: InputDecoration(
                hintText: 'Buscar...',
                hintStyle:
                    TextStyle(color: const Color(0XFFFDFFE2).withOpacity(0.5)),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          PopupMenuButton<int>(
            icon: const Icon(Icons.person, color: Color(0XFFFDFFE2)),
            onSelected: (value) {
              if (value == 1) {
                // Mostrar el modal de confirmación de cierre de sesión
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmación'),
                      content:
                          const Text('¿Estás seguro que deseas cerrar sesión?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Cerrar sesión'),
                        ),
                      ],
                    );
                  },
                ).then((result) {
                  if (result == true) {
                    ref.read(authProvider.notifier).logout();
                    context.go('/login');
                  }
                });
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
