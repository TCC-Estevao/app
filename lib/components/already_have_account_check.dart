import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Não possui uma conta? " : "Já possui uma conta? ",
          style: TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Crie sua conta aqui" : "Acesse sua conta aqui",
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
