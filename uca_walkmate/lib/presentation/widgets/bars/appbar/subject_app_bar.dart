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
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: const Color(0XFF1A2130),
                onPressed: () {
                  context.pop();
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
