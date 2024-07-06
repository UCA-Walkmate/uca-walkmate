import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/presentation/providers/index_provider.dart';
import 'package:uca_walkmate/presentation/screens/event/event_screen.dart';
import 'package:uca_walkmate/presentation/screens/map/full_screen_map.dart';
import 'package:uca_walkmate/presentation/screens/subject/subject_screen.dart';
import 'package:uca_walkmate/presentation/widgets/bars/searchbar/search_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = [
      const FullScreenMap(),
      const SubjectScreen(),
      const EventScreen(),
    ];
    final selectedIndex = ref.watch(selectedIndexProvider);
    final colors = Theme.of(context).colorScheme;
    

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(index: selectedIndex, children: screens),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Positioned(top: 80, child: SearchAppBar()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Container(
                  color: Colors.transparent, // Hace el contenedor transparente
                  child: BottomNavigationBar(
                    unselectedItemColor: Colors.white,
                    selectedItemColor: colors.secondary,
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      ref.read(selectedIndexProvider.notifier).setIndex(value);
                    },
                    backgroundColor:
                        Colors.black, // Fondo del BottomNavigationBar
                    elevation: 0, // Elimina la sombra
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                        ),
                        label: 'Map',
                        activeIcon: Icon(
                          Icons.location_on_rounded,
                          color: Colors.blue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.book_rounded),
                        label: 'Subject',
                        activeIcon: Icon(
                          Icons.book_rounded,
                          color: Colors.blue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_month),
                        label: 'Events',
                        activeIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.blue,
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
