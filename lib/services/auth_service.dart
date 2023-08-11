// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:app/dtos/user/login-user-dto.dart';
import 'package:app/dtos/user/signup-user-dto.dart';
import 'package:app/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/error_handling.dart';
import '../constants/utils.dart';
import '../providers/user-provider.dart';
import '../screens/Home/home_screen.dart';

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
      log("Senha");
      log(user.password);
      String? uri = dotenv.env['URI'];
      log(uri!);
      http.Response response = await http.post(
        Uri.parse('$uri/user/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      log('${response.statusCode}');

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          log("Deu certto");
          showSnackBar(
            context,
            'Conta criada com sucesso! Voce será direcionado para a página de Login',
          );
          Future.delayed(Duration(seconds: 2), () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginScreen.routeName,
              (route) => false,
            );
          });
        },
      );
    } catch (error, stackTrace) {
      print(stackTrace);
      log("Entrou aqui ${error.toString()}");
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
      String url = '$uri/login';
      log('$url');
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
          SharedPreferences preferences = await SharedPreferences.getInstance();

          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);

          await preferences.setString(
              'x-access-token', jsonDecode(response.body)['access_token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );

          log("Deu tudo certo");
        },
      );
    } catch (error, stackTrace) {
      print(stackTrace);
      log("Entrou aqui Login: ${error.toString()}");
      showSnackBar(context, error.toString());
    }
  }

  /* Future<AuthState> login(EmailCredentialDTO dto);

  Future<AuthState> logout();

  Future<AuthState> checkAuth(); */
}
