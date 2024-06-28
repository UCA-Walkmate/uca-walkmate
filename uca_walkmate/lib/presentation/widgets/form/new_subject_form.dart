import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

class NewSubjectForm extends StatelessWidget {
  const NewSubjectForm({super.key});

  onchange() {
    print('yeih');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
    child: Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre',
                textAlign: TextAlign.end,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFF4B465C),
                    fontSize: 15,
                  ),
                )),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0XFF5A72A0), width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "",
                hintText: "Algebra Vectorial y Matrices",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Ubicación',
                textAlign: TextAlign.end,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFF4B465C),
                    fontSize: 15,
                  ),
                )),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 'hola',
                  child: Text('Hola'),
                ),
                DropdownMenuItem(
                  value: 'como',
                  child: Text('Como'),
                ),
                DropdownMenuItem(
                  value: 'estas',
                  child: Text('Estas'),
                )
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0XFF5A72A0), width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "",
                hintText: "Algebra Vectorial y Matrices",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Horario',
                textAlign: TextAlign.end,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFF4B465C),
                    fontSize: 15,
                  ),
                )),
                
                Column(
                  children: days.map((day) => DailyCheckBox(day: day)).toList(),
                )
                
                
          ],
        ),
      ),
    ),
          );
  }
}


class DailyCheckBox extends StatelessWidget {
  final String day;

  const DailyCheckBox({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(day),
          value: false, 
          onChanged: (value) => true,
          controlAffinity: ListTileControlAffinity.leading,
      )
      ],
    );
  }
}
