import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PersonalizedOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const PersonalizedOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Color.fromRGBO(44, 44, 44, 1),
        minimumSize: Size(200, 60),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        side: BorderSide(color: Color.fromRGBO(207, 230, 255, 1), width: 2),
      ),
      child: Text(text),
    );
  }
}
