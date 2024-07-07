import 'package:formz/formz.dart';

enum NameError { empty, format }

class Name extends FormzInput<String, NameError> {

  const Name.pure() : super.pure('');

  const Name.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NameError.empty) return 'El nombre de la materia es requerida';

    return null;
  }

  @override
  NameError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return NameError.empty;

    return null;
  }
}