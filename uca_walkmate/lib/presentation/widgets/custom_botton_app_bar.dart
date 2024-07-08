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
import 'package:go_router/go_router.dart';

class CustomBottomAppBar extends StatefulWidget {
  // final List<BottomBarItem> items;
  final ValueChanged<int> onTap;
  final int selectedIndex;

  CustomBottomAppBar({
    super.key,
    // required this.items,
    required this.onTap,
    this.selectedIndex = 0,
  });

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _currentIndex = 0;
  List<BottomBarItem> items = [
    BottomBarItem(icon: Icons.home),
    BottomBarItem(icon: Icons.book),
    BottomBarItem(icon: Icons.event),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    //manteniendo el indice actual
    // _currentIndex = index;

    // logica de navegación segun el index con go_router
    switch (index) {
      case 0:
        context.go('/'); // Pass the location as a positional argument
        // context.pop();
        break;
      case 1:
        context.go('/subject'); // Pass the location as a positional argument
        // context.pop();
        break;
      case 2:
        context.go('/events'); // Pass the location as a positional argument
        // context.pop();
        break;
      default:
        context.go('/');
        break;
    }

    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          int index = items.indexOf(item);
          bool isSelected = index == _currentIndex;
          return GestureDetector(
            onTap: () => _onItemTapped(index),
            child: Icon(
              item.icon,
              color: isSelected ? Colors.blue : Colors.white,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BottomBarItem {
  final IconData icon;
  BottomBarItem({required this.icon});
}
