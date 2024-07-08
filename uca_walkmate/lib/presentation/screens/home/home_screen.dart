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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/presentation/providers/index_provider.dart';
import 'package:uca_walkmate/presentation/screens/event/event_screen.dart';
import 'package:uca_walkmate/presentation/screens/map/full_screen_map.dart';
import 'package:uca_walkmate/presentation/screens/subject/subjects_screen.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = [
      const SubjectsScreen(),
      const FullScreenMap(),
      const EventScreen(),
    ];
    final selectedIndex = ref.watch(selectedIndexProvider);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: selectedIndex != 1
          ? AppBar(
              title: Text(
                selectedIndex == 0 ? 'Materias' : 'Eventos',
                style: TextStyle(
                  color: colors.tertiary,
                  fontSize: 22,
                ),
              ),
              backgroundColor: colors.primary,
            )
          : null,
      backgroundColor: const Color(0xFFF8F7FA),
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(index: selectedIndex, children: screens),
          ),

          //cargando la barra de busqueda solo en la pantalla de mapas
          // if (selectedIndex == 1)
          //   const Padding(
          //     padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          //     child: SearchAppBar(),
          //   ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Container(
                  color: Colors.transparent, // Hace el contenedor transparente
                  child: BottomNavigationBar(
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      ref.read(selectedIndexProvider.notifier).setIndex(value);
                    },
                    elevation: 0, // Elimina la sombra
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.book_rounded),
                        label: 'Materias',
                        activeIcon: Icon(
                          Icons.book_rounded,
                          color: colors.secondary,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.location_on_rounded),
                        label: 'Mapa',
                        activeIcon: Icon(
                          Icons.location_on_rounded,
                          color: colors.secondary,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.calendar_month),
                        label: 'Eventos',
                        activeIcon: Icon(
                          Icons.calendar_month,
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
