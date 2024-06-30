import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> days = [
  'Lunes',
  'Martes',
  'Miércoles',
  'Jueves',
  'Viernes',
  'Sábado'
];

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
          padding: const EdgeInsets.all(18),
          children: [
            SizedBox(height: 15,),
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
              height: 10,
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
            SingleChildScrollView(
              child: Column(
                children: days.map((day) => DailyCheckBox(day: day)).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            
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
          title: Text(day),
          value: false,
          onChanged: (value) => true,
          controlAffinity: ListTileControlAffinity.leading,
        )
      ],
    );
  }
}
