import 'package:app/styles/colors.dart';
import 'package:app/screens/SignUp/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../components/already_have_account_check.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_input.dart';
import '../../services/auth_service.dart';
import 'components/rounded_password_input.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    FocusScope.of(context).unfocus();
    authService.loginUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LOGIN",
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 90),
            RoundedInputField(
                hinText: "Your Email",
                icon: Icons.person,
                controller: _emailController),
            RoundedPasswordField(controller: _passwordController),
            RoundedButton(press: () {}, text: "Login"),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
