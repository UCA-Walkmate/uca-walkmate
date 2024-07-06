import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectsAppBar extends StatelessWidget {
  const SubjectsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 500,
      decoration: const BoxDecoration(
          color: Color(0XFF1A2130),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),

            Container(
              width: 45,
              height: 60,
              decoration: const BoxDecoration(
                  color: Color(0XFFFDFFE2), shape: BoxShape.circle),
              child:  IconButton(
                icon: const Icon(Icons.arrow_back) ,
                color: const Color(0XFF1A2130),
                onPressed: () {
                  
                },
                // size: 25,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Text('Añadir Materias',
                textAlign: TextAlign.end,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFFFDFFE2),
                    fontSize: 22,
                  ),
                )), // Text widget

            const SizedBox(
              height: 10,
            ),

            Text(
                'Organiza tus materias para agilizar tus recorridos por el campus de la universidad ',
                style: GoogleFonts.publicSans(
                    textStyle: const TextStyle(
                        color: Color(0XFFFDFFE2), fontSize: 15)))
          ],
        ),
      ),
    );
  }
}
