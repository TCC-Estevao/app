import 'package:app/constants.dart';
import 'package:flutter/material.dart';

import '../../../../components/text_field_input.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextFieldContainer(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
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
