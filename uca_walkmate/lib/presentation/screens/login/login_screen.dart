import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: _LoginForm(textTheme: textTheme, colors: colors, keyboardOpen: keyboardOpen),
          ),      
                   
      
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colors;
  final bool keyboardOpen;
  
  const _LoginForm({
    required this.textTheme,
    required this.colors,
    required this.keyboardOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Email', style: textTheme.bodyMedium),
            TextFormField(
              decoration: const InputDecoration(
              hintText: 'johndoe@email.com',
              prefixIcon: Icon(Icons.email_outlined),
              border: UnderlineInputBorder()
            ),
          ),
              
          const SizedBox(height: 20,),
              
          Text('Contraseña', style: textTheme.bodyMedium),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: '**********',
              prefixIcon: Icon(Icons.lock_outline),
              border: UnderlineInputBorder()
            ),
          ),
    
          const SizedBox(height: 50,),
              
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                color: colors.primary,
                child: InkWell(
                  onTap: () {

                  },
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
    
          SizedBox(height: keyboardOpen? 0 : 75,),
    
        ],
      ),
    );
  }
}

