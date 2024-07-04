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