import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uca_walkmate/domain/domain.dart';
import 'package:uca_walkmate/infrastructure/infrastructure.dart';


final authProvider = StateNotifierProvider<AuthNotifier,AuthState>((ref) {

  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(
    authRepository: authRepository
  );
});



class AuthNotifier extends StateNotifier<AuthState> {

  final AuthRepository authRepository;

  AuthNotifier({
    required this.authRepository
  }): super( AuthState() );
  

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);

    } on CustomException catch (e) {
      logout(e.message);
    } catch (e){
      logout('Uncontrolled error');
    }

  }

  void registerUser( String email, String password ) async {
    
  }

  void checkAuthStatus() async {
    
  }

  void _setLoggedUser( User user ) {
    
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  Future<void> logout([ String? errorMessage ]) async {
    
    state = state.copyWith(
      authStatus: AuthStatus.unathenticated,
      user: null,
      errorMessage: errorMessage
    );
  }

}

enum AuthStatus { checking, authenticated, unathenticated }

class AuthState {

  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking, 
    this.user, 
    this.errorMessage = ''
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) => AuthState(
    authStatus: authStatus ?? this.authStatus,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage
  );

}