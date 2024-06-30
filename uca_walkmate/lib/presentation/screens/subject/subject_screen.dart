import 'package:flutter/material.dart';
import 'package:uca_walkmate/presentation/widgets/custom_botton_app_bar.dart';

class SubjectScreen extends StatefulWidget {
  static const String routeName = 'subject';
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;

     void onBottomBarItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      // Maneja la lógica adicional aquí si es necesario
      
    });
  }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Subject Screen',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          Positioned(
            bottom: 20,
            //posicionando el widget en el centro pero dependiendo del tamaño de la pantalla
            left: 30,
            right:  30,
            child: Center(
              child: CustomBottomAppBar(
                items: [
                  BottomBarItem(icon: Icons.location_on_outlined),
                  BottomBarItem(icon: Icons.book_outlined),
                  BottomBarItem(icon: Icons.calendar_today_rounded),
                ],
                selectedIndex: selectedIndex,
                onTap: onBottomBarItemTapped,
              ),
            ),
          ),
        ],
      ),
    );
  }
}