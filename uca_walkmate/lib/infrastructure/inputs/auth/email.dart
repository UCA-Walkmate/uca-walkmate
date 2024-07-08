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
import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  const Email.pure() : super.pure('');

  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailError.empty) return 'El email es requerido';
    if (displayError == EmailError.format) return 'No tiene formato de correo electrónico';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
