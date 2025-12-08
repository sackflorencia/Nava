import 'package:flutter/material.dart';

class PersonalizedTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  const PersonalizedTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(250, 35),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
