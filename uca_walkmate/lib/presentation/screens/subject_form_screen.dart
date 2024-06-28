import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uca_walkmate/presentation/widgets/appbar/subject_app_bar.dart';
import 'package:uca_walkmate/presentation/widgets/form/new_subject_form.dart';

class SubjectFormScreen extends StatelessWidget {
  const SubjectFormScreen({super.key});

  @override
  Widget build(context) {
    return const Scaffold(
        backgroundColor: Color(0XFFF8F7FA),
        body: Column(
      children: [
        //appbar
        SubjectsAppBar(),

        //form
        NewSubjectForm()
        
      ],
    ));
  }
}

