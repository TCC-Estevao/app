import 'package:app/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:asp/asp.dart';

class AuthReducer extends Reducer {
  AuthReducer() {
    on(() => [checkAuthAction], _checkAuth());
    on(() => [loginWithEmailAction], _loginWithEmail);
    on(() => [logoutAction], _logout());
  }

  _checkAuth() {}
  _loginWithEmail() {}
  _logout() {}
}
