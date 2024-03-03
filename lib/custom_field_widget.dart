import 'package:flutter/material.dart';

class CustomFieldWidget extends StatelessWidget {
  final String label;
  final Function validator;
  final TextEditingController controller;
  final bool obsecureText;
  final int maxLines;
  const CustomFieldWidget({
    super.key,
    required this.label,
    required this.validator,
    required this.controller,
    this.obsecureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      validator: (value) => validator(value),
      obscureText: obsecureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
