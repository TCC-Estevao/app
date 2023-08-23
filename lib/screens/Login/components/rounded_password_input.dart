import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../components/text_field_input.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;

  const RoundedPasswordField({
    super.key,
    required this.controller,
  });

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe uma senha';
          }
          return null;
        },
        obscureText: !visible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: "Senha",
          labelStyle: const TextStyle(color: primaryColor),
          prefixIcon: const Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
            color: primaryColor,
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
