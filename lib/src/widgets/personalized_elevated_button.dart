import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PersonalizedElevatedButton extends StatelessWidget {
  final Color color;
  final String text;
  const PersonalizedElevatedButton({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Fluttertoast.showToast(msg: "Esta función todavía no está disponible");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(200, 60),
        textStyle: TextStyle(fontSize: 20),
      ),
      child: Text(text),
    );
  }
}
