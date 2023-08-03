import 'package:app/constants.dart';
import 'package:app/screens/auth/Login/login_screen.dart';
import 'package:app/screens/auth/SignUp/body.dart';
import 'package:app/screens/auth/SignUp/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Bem vindo ao FullWallet",
                style: TextStyle(
                    fontSize: titleFontSize, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 80),
              RoundedButton(
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
                text: "LOGIN",
              ),
              RoundedButton(
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
                color: primaryLightColor,
                textColor: Colors.black,
                text: "Criar Conta",
              ),
            ],
          )),
    );
  }
}
