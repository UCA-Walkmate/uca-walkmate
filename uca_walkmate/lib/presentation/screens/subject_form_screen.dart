import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uca_walkmate/presentation/widgets/appbar/subject_app_bar.dart';
import 'package:uca_walkmate/presentation/widgets/form/new_subject_form.dart';

class SubjectFormScreen extends StatelessWidget {
  const SubjectFormScreen({super.key});

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0XFFF8F7FA),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Appbar
              const SubjectsAppBar(),

              Stack(
                children: [
                  //Form
                  const SingleChildScrollView(child: NewSubjectForm()),

                  //Button
                  Positioned(
                      bottom: 0,
                      left: screenWidth - 300,
                      child: const NewSubjectButton()),
                ],
              )

              //Button
            ],
          ),
        ));
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
