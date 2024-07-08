import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/presentation/screens/map/full_screen_map.dart';

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
