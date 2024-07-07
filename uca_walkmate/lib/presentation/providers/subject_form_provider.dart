
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:uca_walkmate/domain/entities/location.dart';
import 'package:uca_walkmate/infrastructure/inputs/subjects/location.dart';
import 'package:uca_walkmate/infrastructure/inputs/subjects/name.dart';
import 'package:uca_walkmate/presentation/providers/subject_provider.dart';

final subjectFormProvider = StateNotifierProvider.autoDispose<SubjectFormNotifier, SubjectFormState>((ref) {
  final addSubjectCallback = ref.watch(subjectProvider.notifier).addSubject;

  return SubjectFormNotifier(addSubjectCallback: addSubjectCallback);
});


class SubjectFormNotifier extends StateNotifier<SubjectFormState> {
  final Function(String, int, String, String, int) addSubjectCallback;

  SubjectFormNotifier({
    required this.addSubjectCallback
  }) : super(SubjectFormState());

  onNameChange(String value) {
    final newName = Name.dirty(value);

    state = state.copyWith(
      name: newName,
      isValid: Formz.validate([newName, state.location])
    );
  }

  onLocationChange(String value) {
    final newLocation = LocationInput.dirty(value);

    state = state.copyWith(
      location: newLocation,
      isValid: Formz.validate([newLocation, state.name])
    );
  }

  onLocationIdChange(int value) {
    state = state.copyWith(
      locationId: value
    );
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state.copyWith(isPosting: true);

    await addSubjectCallback(state.name.value, state.locationId, '------', 'ENC', state.image);

    state.copyWith(isPosting: false);

  }

  void select(int value){
    state = state.copyWith(
      image: value
    );
  }

  void cleanState() {
    state = state.copyWith(
      name: const Name.pure(),
      location: const LocationInput.pure(),
      locationId: 0,
      image: 0,    
    );
  }

  _touchEveryField() {
    state = state.copyWith(
      isFormPosted: true,
      name: Name.dirty(state.name.value),
      location: LocationInput.dirty(state.location.value)
    );
  }

}

class SubjectFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Name name;
  final LocationInput location;
  final int locationId;
  final String schedule;
  final int image;
  final List<Location> locations;

  SubjectFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.name = const Name.pure(),
    this.location = const LocationInput.pure(),
    this.locationId = 0,
    this.schedule = '',
    this.image = 0,
    this.locations = const [],
  });

  SubjectFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Name? name,
    LocationInput? location,
    int? image,
    int? locationId,
  }) {
    return SubjectFormState(
      isPosting: isPosting ?? this.isPosting,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      name: name ?? this.name,
      location: location ?? this.location,
      image: image ?? this.image,
      locationId: locationId ?? this.locationId,
    );
  }

}