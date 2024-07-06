import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationModal extends StatelessWidget {
  const LocationModal({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Text('Jon de Cortina',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.publicSans(
                        textStyle: const TextStyle(
                          color: Color(0XFF1A2130),
                          fontSize: 30,
                        ),
                      )),
          ),
           Text('Vigilancia',
                textAlign: TextAlign.end,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFF1A2130),
                    fontSize: 15,
                  ),
                )),
        ],
      ),

    );
  }
}
