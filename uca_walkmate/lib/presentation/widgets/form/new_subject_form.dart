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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:uca_walkmate/presentation/providers/subject_form_provider.dart';
import 'package:uca_walkmate/presentation/providers/subject_provider.dart';

class NewSubjectForm extends ConsumerWidget {
  const NewSubjectForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenHeight = MediaQuery.of(context).size.height;
    final subjectForm = ref.watch(subjectFormProvider);
    final locationAux = ref.watch(subjectProvider).locations;
    final locations = ref.watch(subjectProvider).locations.map((location) => location.name).toList();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SizedBox(
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
                    fontWeight: FontWeight.normal,
                  ),
                )
              ),
      
              TextFormField(
                onChanged: ref.read(subjectFormProvider.notifier).onNameChange,
                decoration: InputDecoration(
                  errorText: subjectForm.isFormPosted? subjectForm.name.errorMessage : null,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: const Icon(Icons.book),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0XFF5A72A0), width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "",
                  hintText: "Algebra Vectorial y Matrices",
                  hintStyle: const TextStyle(
                    color: Color(0xFFB7B5BE), 
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
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
                )
              ),
      
              DropdownSearch<String>(
                items: locations,
                selectedItem: subjectForm.location.value,
                filterFn: (item, filter) => item.toLowerCase().startsWith(filter.toLowerCase()),
                onChanged: (String? value) {
                  for (var location in locationAux) {
                    if (location.name == value) {
                      ref.read(subjectFormProvider.notifier).onLocationIdChange(location.id);
                    }
                  }

                  ref.read(subjectFormProvider.notifier).onLocationChange(value!);
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    errorText: subjectForm.isFormPosted? subjectForm.location.errorMessage : null,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0XFF5A72A0), width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Seleccione una ubicación",
                    hintStyle: const TextStyle(
                      color: Color(0xFFB7B5BE), 
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
      
              const SizedBox(
                height: 15,
              ),

              Text('Imagen',
                textAlign: TextAlign.start,
                style: GoogleFonts.publicSans(
                  textStyle: const TextStyle(
                    color: Color(0XFF4B465C),
                    fontSize: 15,
                  ),
                )
              ),
      
              Column(
                children: [
                  RadioListTile(
                    value: 0,
                    groupValue: subjectForm.image,
                    onChanged: (int? value) {
                      ref.read(subjectFormProvider.notifier).select(value!);
                    },
                    title: const Text('Imagen 1'),
                    secondary: Image.asset('assets/images/card_image-0.jpg', width: 40, height: 40),
                  ),

                  RadioListTile(
                    value: 1,
                    groupValue: subjectForm.image,
                    onChanged: (int? value) {
                      ref.read(subjectFormProvider.notifier).select(value!);
                    },
                    title: const Text('Imagen 2'),
                    secondary: Image.asset('assets/images/card_image-1.jpg', width: 40, height: 40),
                  ),

                  RadioListTile(
                    value: 2,
                    groupValue: subjectForm.image,
                    onChanged: (int? value) {
                      ref.read(subjectFormProvider.notifier).select(value!);
                    },
                    title: const Text('Imagen 3'),
                    secondary: Image.asset('assets/images/card_image-2.jpg', width: 40, height: 40),
                  ),

                  RadioListTile(
                    value: 3,
                    groupValue: subjectForm.image,
                    onChanged: (int? value) {
                      ref.read(subjectFormProvider.notifier).select(value!);
                    },
                    title: const Text('Imagen 4'),
                    secondary: Image.asset('assets/images/card_image-3.jpg', width: 40, height: 40),
                  ),

                  RadioListTile(
                    value: 4,
                    groupValue: subjectForm.image,
                    onChanged: (int? value) {
                      ref.read(subjectFormProvider.notifier).select(value!);
                    },
                    title: const Text('Imagen 5'),
                    secondary: Image.asset('assets/images/card_image-4.jpg', width: 40, height: 40),
                  ),

                  RadioListTile(
                    value: 5,
                    groupValue: subjectForm.image,
                    onChanged: (int? value) {
                      ref.read(subjectFormProvider.notifier).select(value!);
                    },
                    title: const Text('Imagen 6'),
                    secondary: Image.asset('assets/images/card_image-5.jpg', width: 40, height: 40),
                  ),

                  RadioListTile(
                    value: 6,
                    groupValue: subjectForm.image,
                    onChanged: (int? value) {
                      ref.read(subjectFormProvider.notifier).select(value!);
                    },
                    title: const Text('Imagen 7'),
                    secondary: Image.asset('assets/images/card_image-6.jpg', width: 40, height: 40),
                  ),
                 
                ],
              ),
            
      
              const SizedBox(
                height: 20,
              ),
      
              ElevatedButton(
                onPressed: subjectForm.isPosting? 
                  null
                  :
                  () {
                    ref.read(subjectFormProvider.notifier).onFormSubmit();
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Materia agregada exitosamente'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                    
                    ref.read(subjectFormProvider.notifier).cleanState();
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
                      fontSize: 16,
                    ),
                  )
                ),
              )
            
            ],
          ),
        ),
      ),
    );
  }
}
