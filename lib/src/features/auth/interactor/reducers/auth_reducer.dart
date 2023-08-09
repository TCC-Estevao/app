import 'package:app/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:app/src/features/auth/interactor/services/auth_service.dart';
import 'package:asp/asp.dart';

class AuthReducer extends Reducer {
  final AuthService service;
  AuthReducer(this.service) {
    on(() => [checkAuthAction], _checkAuth());
    on(() => [loginWithEmailAction], _loginWithEmail);
    on(() => [logoutAction], _logout());
  }

  _checkAuth() {
    service.checkAuth().then(authState.setValue);
  }

  _loginWithEmail() {
    final dto = loginWithEmailAction.value;
    service.login(dto).then(authState.setValue);
  }

  _logout() {
    service.logout().then(authState.setValue);
  }
}
