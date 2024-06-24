import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  final List<BottomBarItem> items;
  final ValueChanged<int> onTap;
  final int selectedIndex;

  CustomBottomAppBar({
    required this.items,
    required this.onTap,
    this.selectedIndex = 0,
  });

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
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
