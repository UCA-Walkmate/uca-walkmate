import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uca_walkmate/presentation/providers/auth_provider.dart';
import 'package:uca_walkmate/presentation/providers/login_form_provider.dart';
import 'package:uca_walkmate/presentation/widgets/shared/custom_text_form_field.dart';
import 'package:uca_walkmate/presentation/widgets/shared/wave_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [ 
            // Top wave animation
            Container(
              height: size.height - 200,
              color: colors.primary,
            ),
      
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Colors.white,
              ),
            ),
      
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Bienvenido a \nUCA Walkmate',
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
            _LoginForm(keyboardOpen: keyboardOpen, colors: colors, textTheme: textTheme),                 
        
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  final bool keyboardOpen;
  final ColorScheme colors;
  final TextTheme textTheme;
  
  const _LoginForm({
    required this.keyboardOpen,
    required this.colors,
    required this.textTheme
  });

  void showSnackbar( BuildContext context, String message ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;

      showSnackbar(context, next.errorMessage);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          CustomTextFormField(
            label: 'Email',
            hintText: 'johndoe@email.com',
            prefixIcon: Icons.email_outlined,
            onChanged: ref.read(loginFormProvider.notifier).onEmailChange,
            errorMessage: loginForm.isFormPosted? loginForm.email.errorMessage : null,
          ),
              
          const SizedBox(height: 20,),

          CustomTextFormField(
            label: 'Contraseña',
            hintText: '***********',
            prefixIcon: Icons.lock_outline,
            onChanged: ref.read(loginFormProvider.notifier).onPasswordChange,
            errorMessage: loginForm.isFormPosted? loginForm.password.errorMessage : null,
            obscureText: true,
          ),
    
          const SizedBox(height: 50,),
              
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                color: colors.primary,
                child: InkWell(
                  onTap: loginForm.isPosting? null : ref.read(loginFormProvider.notifier).onFormSubmit,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Center(
                      child: Text("Login", style: TextStyle(color: Colors.white),)
                    )
                  ),
                ),
              ),
            ),
          ),
    
          const SizedBox(height: 15,),
    
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                context.go('/signup');
              },
              style: OutlinedButton.styleFrom(                        
                side: BorderSide(color: colors.primary, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ), 
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Registrarse', style: textTheme.bodyMedium?.copyWith(color: colors.primary))
              ),
            ),
          ),
    
          SizedBox(height: keyboardOpen? 15 : 50),
    
        ],
      ),
    );
  }
}

