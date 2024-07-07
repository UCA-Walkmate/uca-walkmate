import 'package:flutter/material.dart';
import 'package:uca_walkmate/presentation/widgets/bars/appbar/subject_app_bar.dart';
import 'package:uca_walkmate/presentation/widgets/form/new_subject_form.dart';

class SubjectFormScreen extends StatelessWidget {
  static const routeName = 'subject-form';
 
  const SubjectFormScreen({super.key});

  
  @override
  Widget build(context) {

    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0XFFF8F7FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Appbar
            SubjectsAppBar(),
            
            // Form
            SingleChildScrollView(
              child: NewSubjectForm()
            ),
          ],
        ),
      )
    );
  }
}

