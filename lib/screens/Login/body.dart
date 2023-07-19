import 'package:app/constants.dart';
import 'package:app/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../components/already_have_account_check.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_input.dart';
import 'components/rounded_password_input.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
              "LOGIN",
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 90),
            const RoundedInputField(hinText: "Your Email", icon: Icons.person),
            const RoundedPasswordField(),
            RoundedButton(press: () {}, text: "Login"),
            const SizedBox(height: 30),
            AlreadyHaveAnAccountCheck(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
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
