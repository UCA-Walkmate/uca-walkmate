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

enum NameValidationError { empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty(String value ) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NameValidationError.empty) return 'El nombre es requerido';

    return null;
  }

  @override
  NameValidationError? validator(String value) {
    return value.isNotEmpty ? null : NameValidationError.empty;
  }
}
