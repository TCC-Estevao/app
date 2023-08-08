import 'package:app/screens/auth/interactor/entities/tokenization.dart';

sealed class AuthState {}

class InitAuth implements AuthState {}

class LoadingAuth implements AuthState {}

class Logged implements AuthState {
  final Tokenization token;

  Logged(this.token);
}

class UnLogged implements AuthState {
  final Tokenization token;

  UnLogged(this.token);
}
