import 'package:app/screens/auth/interactor/dtos/email_credential_dto.dart';
import 'package:app/screens/auth/interactor/states/auth_state.dart';
import 'package:asp/asp.dart';

final authState = Atom<AuthState>(InitAuth(), key: 'authState');

final checkAuthAction = Atom.action(key: 'checkAuthAction');

final loginWithEmailAction = Atom<EmailCredentialDTO>(
    EmailCredentialDTO.empty(),
    key: 'loginWithEmailAction');

final logoutAction = Atom.action(key: "logoutAction");
