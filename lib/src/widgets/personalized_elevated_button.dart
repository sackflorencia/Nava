import 'package:flutter/material.dart';

class PersonalizedElevatedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function () onPressed;
  const PersonalizedElevatedButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        minimumSize: Size(200, 60),
        textStyle: TextStyle(fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(44, 44, 44, 1)
        ),
        foregroundColor: Color.fromRGBO(44, 44, 44, 1)
      ),
      child: Text(text),
    );
  }
}
