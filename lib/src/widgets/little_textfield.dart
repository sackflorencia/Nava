import 'package:flutter/material.dart';

class LittleTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const LittleTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
    );
  }
}