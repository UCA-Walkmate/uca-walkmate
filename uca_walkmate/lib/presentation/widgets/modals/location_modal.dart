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
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:uca_walkmate/domain/domain.dart';

class LocationModal extends StatelessWidget {
  final Future<void> Function(LatLng) getCoordinate;
  final Function() cleanRoute;
  final String location;
  final Category category;
  final Geom geom;

  LocationModal({
    super.key,
    required this.getCoordinate,
    required this.cleanRoute,
    required this.location, 
    required this.category, 
    required this.geom
  });

  @override
  Widget build(BuildContext context) {
    final coordinates = LatLng(geom.coordinates[1], geom.coordinates[0]);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child:  Column(
        
        children: [
          const SizedBox(
              height: 30,
            ),

          Align(
            alignment: Alignment.center,
            child: Image.asset(
                'assets/images/localizacion.png',
                width: 100,
              ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.center,
              child: Text(location, // aca ira el nombre del lugar seleccionado en la busqueda
                        textAlign: TextAlign.start,
                        style: GoogleFonts.publicSans(
                          textStyle: const TextStyle(
                            color: Color(0XFF1A2130),
                            fontSize: 30,
                          ),
                        )),
            ),
          ),
          const SizedBox( height: 15),
           Text(category.name,
                textAlign: TextAlign.end,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFF1A2130),
                    fontSize: 15,
                  ),
                )),
          const SizedBox( height: 15),
           ElevatedButton(
              onPressed: () {
                cleanRoute();
                getCoordinate(coordinates);

                Navigator.pop(context);
              },
              child: const Text('Ir', style: TextStyle(fontSize: 20),),
            ),
        ],
      ),

    );
  }
}
