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

enum PasswordError { empty, format }

class Password extends FormzInput<String, PasswordError> {
  // static final RegExp passwordRegExp = RegExp(r'(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$');

  const Password.pure() : super.pure('');

  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) return 'La contraseña es requerida';
    // if ( displayError == PasswordError.format ) return 'Debe de tener Mayúscula, letras y un número';

    return null;
  }

  @override
  PasswordError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    // if ( !passwordRegExp.hasMatch(value) ) return PasswordError.format;

    return null;
  }
}