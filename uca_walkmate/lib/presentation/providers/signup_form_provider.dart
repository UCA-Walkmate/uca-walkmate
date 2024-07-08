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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:uca_walkmate/infrastructure/inputs/auth/name.dart';
import 'package:uca_walkmate/infrastructure/inputs/inputs.dart';
import 'package:uca_walkmate/presentation/providers/auth_provider.dart';

final signUpFormProvider = StateNotifierProvider.autoDispose<SignupFormNotifier, SignupFormState>((ref) {
  final registerUserCallback = ref.watch(authProvider.notifier).registerUser;

  return SignupFormNotifier(registerUserCallback: registerUserCallback);
});


class SignupFormNotifier extends StateNotifier<SignupFormState> {
  final Function(String, String, String, String) registerUserCallback;

  SignupFormNotifier({
    required this.registerUserCallback,
  }) : super(SignupFormState());

  void onEmailChange(String value) {
    final newEmail = Email.dirty(value);

    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.name, state.password, state.confirmPassword]),
    );
  }

  void onNameChange(String value) {
    final newName = Name.dirty(value);

    state = state.copyWith(
      name: newName,
      isValid: Formz.validate([state.email, newName, state.password, state.confirmPassword]),
    );
  }

  void onPasswordChange(String value) {
    final newPassword = Password.dirty(value);

    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([state.email, state.name, newPassword, state.confirmPassword]),
    );
  }

  void onConfirmPasswordChange(String value) {
    final newConfirmPassword = Password.dirty(value);

    state = state.copyWith(
      confirmPassword: newConfirmPassword,
      isValid: Formz.validate([state.email, state.name, state.password, newConfirmPassword]),
    );
  }

  void onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state.copyWith(isPosting: true);

    await registerUserCallback(
      state.email.value,
      state.name.value,
      state.password.value,
      state.confirmPassword.value,
    );

    state.copyWith(isPosting: false);
  }

  void _touchEveryField() {
    state = state.copyWith(
      isFormPosted: true,
      email: Email.dirty(state.email.value),
      name: Name.dirty(state.name.value),
      password: Password.dirty(state.password.value),
      confirmPassword: Password.dirty(state.confirmPassword.value),
    );
  }
}

class SignupFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Name name;
  final Password password;
  final Password confirmPassword;

  SignupFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.name = const Name.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
  });

  SignupFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Name? name,
    Password? password,
    Password? confirmPassword,
  }) =>
      SignupFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
      );
}
