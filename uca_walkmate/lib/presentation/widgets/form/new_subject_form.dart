import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> days1 = ['Lunes', 'Martes', 'Miércoles'];

List<String> days2 = ['Jueves', 'Viernes', 'Sábado'];

class NewSubjectForm extends StatelessWidget {
  const NewSubjectForm({super.key});

  onchange() {
    print('yeih');
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight - 240,
      child: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          children: [
            const SizedBox(
              height: 15,
            ),
            Text('Nombre',
                textAlign: TextAlign.start,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFF4B465C),
                    fontSize: 15,
                  ),
                )),
            TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: const Icon(Icons.book),
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0XFF5A72A0), width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "",
                hintText: "Algebra Vectorial y Matrices",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text('Ubicación',
                textAlign: TextAlign.start,
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
                  child: Text('Auditorio'),
                ),
                DropdownMenuItem(
                  value: 'como',
                  child: Text('Aulas D'),
                ),
                DropdownMenuItem(
                  value: 'estas',
                  child: Text('Magna I'),
                )
              ],
              onChanged: (value) {},
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0XFF5A72A0), width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                labelText: "",
                hintText: "Escoge la ubicación",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text('Horario',
                textAlign: TextAlign.start,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFF4B465C),
                    fontSize: 15,
                  ),
                )),
            Row(
              children: [
                Expanded(
                  // Fills available space horizontally
                  child: Column(
                    children:
                        days1.map((day) => DailyCheckBox(day: day)).toList(),
                  ),
                ),
                Expanded(
                  // Second column with similar logic
                  child: Column(
                    children:
                        days2.map((day) => DailyCheckBox(day: day)).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const NewSubjectButton()
          ],
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
          title: Text(day,
              textAlign: TextAlign.start,
              style: GoogleFonts.publicSans(
                textStyle: const TextStyle(
                  color: Color(0XFF4B465C),
                  fontSize: 15,
                ),
              )),
          value: false,
          onChanged: (value) => true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: const EdgeInsets.only(left: 8),
        )
      ],
    );
  }
}

class NewSubjectButton extends StatelessWidget {
  const NewSubjectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF1A2130),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text('Agregar materia',
          textAlign: TextAlign.end,
          style: GoogleFonts.publicSans(
            textStyle: const TextStyle(
              color: Color(0XFFFDFFE2),
              fontSize: 18,
            ),
          )),
    );
  }
}
