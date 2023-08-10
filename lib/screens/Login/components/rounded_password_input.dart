import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../components/text_field_input.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  const RoundedPasswordField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.visibility,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
