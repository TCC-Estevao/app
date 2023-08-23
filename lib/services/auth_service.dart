// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:app/dtos/user/login-user-dto.dart';
import 'package:app/dtos/user/signup-user-dto.dart';
import 'package:app/models/storage_item.dart';
import 'package:app/screens/Login/login_screen.dart';
import 'package:app/services/secure_storeage_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../constants/error_handling.dart';
import '../constants/utils.dart';
import '../providers/user-provider.dart';
import '../screens/BottomMenu/bottom_menu.dart';

class AuthService {
  //sign up user
  Future<void> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      SignUpUserDTO user =
          SignUpUserDTO(email: email, password: password, name: name);
      String? uri = dotenv.env['URI'];
      http.Response response = await http.post(
        Uri.parse('$uri/user/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Conta criada com sucesso! Voce será direcionado para a página de Login',
          );
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginScreen.routeName,
              (route) => false,
            );
          });
        },
      );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      LoginUserDTO user = LoginUserDTO(email: email, password: password);
      String? uri = dotenv.env['URI'];
      http.Response response = await http.post(
        Uri.parse('$uri/login'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          final StorageService storageService = StorageService();

          final StorageItem token = StorageItem(
              'x-access-token', jsonDecode(response.body)['access_token']);

          storageService.writeSecureData(token);

          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);

          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomMenu.routeName,
            (route) => false,
          );
        },
      );
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  /* Future<AuthState> login(EmailCredentialDTO dto);

  Future<AuthState> logout();

  Future<AuthState> checkAuth(); */
}
