import 'package:app/components/text_field_input.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hinText;
  final IconData icon;
  final TextEditingController controller;

  const RoundedInputField({
    super.key,
    required this.hinText,
    required this.controller,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinText,
          border: InputBorder.none,
          icon: Icon(icon, color: primaryColor),
        ),
      ),
    );
  }
}
