
import 'package:app/components/already_have_account_check.dart';
import 'package:app/components/rounded_button.dart';
import 'package:app/components/rounded_input.dart';
import 'package:app/screens/Login/components/rounded_password_input.dart';
import 'package:app/screens/Login/login_screen.dart';
import 'package:app/utils/validations/email.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../services/auth_service.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    FocusScope.of(context).unfocus();
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
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
              "Cadastrar Conta",
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            RoundedInputField(
              hinText: "Seu nome",
              icon: Icons.person,
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Informe um nome válido';
                }
                return null;
              },
            ),
            RoundedInputField(
              hinText: "Seu email",
              icon: Icons.person,
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe um email';
                }
                if (!isValidEmail(value)) {
                  return 'Informe um email válido';
                }
                return null;
              },
            ),
            RoundedPasswordField(controller: _passwordController),
            RoundedButton(
              press: () {
                signUpUser();
              },
              text: "Criar Conta",
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
              login: false,
            )
          ],
        ),
      ),
    );
  }
}
