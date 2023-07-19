import 'package:app/components/already_have_account_check.dart';
import 'package:app/components/rounded_button.dart';
import 'package:app/components/rounded_input.dart';
import 'package:app/screens/Login/components/rounded_password_input.dart';
import 'package:app/screens/Login/login_screen.dart';
import 'package:app/screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
            const RoundedInputField(
              hinText: "Seu email",
              icon: Icons.person,
            ),
            const RoundedPasswordField(),
            RoundedButton(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const WelcomeScreen();
                    },
                  ),
                );
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
