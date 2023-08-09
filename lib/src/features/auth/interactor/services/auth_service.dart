// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:app/src/features/auth/interactor/dtos/email_credential_dto.dart';
import 'package:app/src/features/auth/interactor/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../constants/error_handling.dart';
import '../../../../../constants/utils.dart';
import '../../../../../models/user.dart';

abstract class AuthService {
  //sign up user
  Future<void> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        isAdmin: false,
        category: [],
        financialAccount: [],
        spendingLimit: -1,
        token: '',
      );
      String? uri = dotenv.env['URI'];
      log(uri!);
      http.Response response = await http.post(
        Uri.parse('$uri/user/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  Future<AuthState> login(EmailCredentialDTO dto);

  Future<AuthState> logout();

  Future<AuthState> checkAuth();
}
