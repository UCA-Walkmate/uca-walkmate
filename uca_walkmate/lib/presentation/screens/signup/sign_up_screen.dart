import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uca_walkmate/presentation/widgets/shared/wave_widget.dart';


class SignUpScreen extends StatelessWidget {
  static const String routeName = 'signup';
  
  const SignUpScreen({super.key});

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
              yOffset: keyboardOpen? size.height / 5 : size.height / 4.5,
              color: Colors.white,
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Registrate',
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
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: keyboardOpen? 40.0 : 0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Nombre', style: textTheme.bodyMedium),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'John Doe',
                          prefixIcon: Icon(Icons.person_outline),
                          border: UnderlineInputBorder()
                        ),
                      ),
                            
                      const SizedBox(height: 20,),
                            
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
                            
                      const SizedBox(height: 20,),
                            
                      Text('Confirmar contraseña', style: textTheme.bodyMedium),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: '**********',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: UnderlineInputBorder()
                        ),
                      ),
                            
                      const SizedBox(height: 35,),
                  
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
                                  child: Text("Registrarse", style: TextStyle(color: Colors.white),)
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 10,),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('¿Ya tienes una cuenta?', style: textTheme.bodyMedium?.copyWith(fontSize: 15,)),
                          const SizedBox(width: 5,),
                          InkWell(
                            child: Text('Inicia sesión', style: textTheme.bodyMedium?.copyWith(fontSize: 15, color: colors.primary),),
                            onTap: () {
                              context.go('/');
                            }
                          ),
                        ],
                      ),
                            
                            
                      SizedBox(height: keyboardOpen? 0 : 45,),
                    ],
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}