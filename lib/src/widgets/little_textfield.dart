import 'package:flutter/material.dart';
import 'package:nava/src/theme/colors.dart';

class LittleTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Color color;

  const LittleTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: TextField(
        controller: controller,
        style: TextStyle(color: color),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          hintStyle: TextStyle(color: color.withValues()),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
          ),
        ),
      ),
    );
  }
}