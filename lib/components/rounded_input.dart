import 'package:app/components/text_field_input.dart';
import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const RoundedInputField({
    super.key,
    required this.hinText,
    required this.controller,
    this.icon = Icons.person,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: hinText,
          labelStyle: const TextStyle(color: primaryColor),
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
          prefixIcon: Icon(icon, color: primaryColor),
        ),
      ),
    );
  }
}
