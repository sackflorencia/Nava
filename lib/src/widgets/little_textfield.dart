import 'package:flutter/material.dart';
import 'package:nava/src/theme/colors.dart';

class LittleTextField extends StatefulWidget {
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
  State<LittleTextField> createState() => _LittleTextFieldState();
}

class _LittleTextFieldState extends State<LittleTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        controller: widget.controller,
        style: TextStyle(color: widget.color),
        obscureText: _isObscured,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          hintStyle: TextStyle(color: widget.color.withValues()),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: widget.color),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          filled: true, 
          fillColor: widget.color.withValues(alpha: 0.2),
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: _togglePasswordView,
                  child: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: widget.color,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
}
