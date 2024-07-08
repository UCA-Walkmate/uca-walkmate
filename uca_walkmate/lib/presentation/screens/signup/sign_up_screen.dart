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
import 'package:uca_walkmate/presentation/providers/auth_provider.dart';
import 'package:uca_walkmate/presentation/providers/signup_form_provider.dart';
import 'package:uca_walkmate/presentation/widgets/shared/wave_widget.dart';
import 'package:uca_walkmate/presentation/widgets/shared/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height - 200,
            color: colors.primary,
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.3 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: keyboardOpen ? size.height / 5 : size.height / 4.5,
              color: Colors.white,
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Regístrate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          // FORM
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 30.0, vertical: keyboardOpen ? 40.0 : 0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _SignUpForm(
                keyboardOpen: keyboardOpen,
                colors: colors,
                textTheme: textTheme,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpForm extends ConsumerWidget {
  final bool keyboardOpen;
  final ColorScheme colors;
  final TextTheme textTheme;

  const _SignUpForm({
    required this.keyboardOpen,
    required this.colors,
    required this.textTheme,
  });

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupForm = ref.watch(signUpFormProvider);
    final password = ref.watch(signUpFormProvider).password.value;
    final confirPassword = ref.watch(signUpFormProvider).confirmPassword.value;

    

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;

      showSnackbar(context, next.errorMessage);
    });

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Nombre', style: textTheme.bodyMedium),
          CustomTextFormField(
            hintText: 'John Doe',
            prefixIcon: Icons.person_outline,
            onChanged: ref.read(signUpFormProvider.notifier).onNameChange,
            errorMessage:
                signupForm.isFormPosted ? signupForm.name.errorMessage : null,
          ),
          const SizedBox(height: 20),
          Text('Email', style: textTheme.bodyMedium),
          CustomTextFormField(
            hintText: 'johndoe@email.com',
            prefixIcon: Icons.email_outlined,
            onChanged: ref.read(signUpFormProvider.notifier).onEmailChange,
            errorMessage:
                signupForm.isFormPosted ? signupForm.email.errorMessage : null,
          ),
          const SizedBox(height: 20),
          Text('Contraseña', style: textTheme.bodyMedium),
          CustomTextFormField(
            hintText: '**********',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            onChanged: ref.read(signUpFormProvider.notifier).onPasswordChange,
            errorMessage: signupForm.isFormPosted
                ? signupForm.password.errorMessage
                : null,
          ),
          const SizedBox(height: 20),
          Text('Confirmar contraseña', style: textTheme.bodyMedium),
          CustomTextFormField(
            hintText: '**********',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            onChanged:
                ref.read(signUpFormProvider.notifier).onConfirmPasswordChange,
            errorMessage: signupForm.isFormPosted
                ? signupForm.confirmPassword.errorMessage
                : null,
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                color: colors.primary,
                child: InkWell(
                  onTap: signupForm.isPosting
                      ? null
                      : () {
                          if (password != confirPassword) {
                            showSnackbar(context, 'Las contraseñas no coinciden');
                            return;
                          }
                          ref.read(signUpFormProvider.notifier).onFormSubmit();
                          context.go('/login');
                        },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Center(
                      child: Text(
                        "Registrarse",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Ya tienes una cuenta?',
                style: textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              const SizedBox(width: 5),
              InkWell(
                child: Text(
                  'Inicia sesión',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontSize: 15, color: colors.primary),
                ),
                onTap: () {
                  context.go('/');
                },
              ),
            ],
          ),
          SizedBox(height: keyboardOpen ? 0 : 45),
        ],
      ),
    );
  }
}
