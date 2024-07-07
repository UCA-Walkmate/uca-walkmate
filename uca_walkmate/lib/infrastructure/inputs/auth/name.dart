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
