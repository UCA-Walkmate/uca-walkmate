import 'package:formz/formz.dart';

enum LocationError { empty, format }

class LocationInput extends FormzInput<String, LocationError> {

  const LocationInput.pure() : super.pure('');

  const LocationInput.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == LocationError.empty) return 'La ubicación es requerida';

    return null;
  }

  @override
  LocationError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return LocationError.empty;

    return null;
  }
}