import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutConfirmationModal extends StatelessWidget {
  const LogoutConfirmationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¿Estás seguro que deseas cerrar sesión?',
            textAlign: TextAlign.center,
            style: GoogleFonts.publicSans(
              textStyle: const TextStyle(
                color: Color(0XFF1A2130),
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
