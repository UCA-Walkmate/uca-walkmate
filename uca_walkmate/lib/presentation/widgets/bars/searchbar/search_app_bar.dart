import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uca_walkmate/presentation/widgets/modals/location_modal.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: const Color(0XFF1A2130),
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
          const Expanded(
            child: TextField(
              style: TextStyle(color: Color(0XFFFDFFE2)),
              decoration: InputDecoration(
                hintText: 'Buscar',
                hintStyle: TextStyle(color: Color(0XFFFDFFE2)),
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
