import 'package:flutter/material.dart';
import 'package:uca_walkmate/presentation/widgets/modals/location_modal.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color:  colors.onPrimary,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const LocationModal();
                  },
                );
              },
              color: Colors.white),
          const SizedBox(width: 8.0),
           Expanded(
            child: TextField(
              style: TextStyle(color: const Color(0XFFFDFFE2).withOpacity(0.4)),
              decoration: InputDecoration(
                hintText: 'Buscar...',
                hintStyle: TextStyle(color: const  Color(0XFFFDFFE2).withOpacity(0.5) ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          const Icon(Icons.person, color:Color(0XFFFDFFE2)),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
