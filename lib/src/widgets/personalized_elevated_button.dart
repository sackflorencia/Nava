import 'package:flutter/material.dart';

class PersonalizedElevatedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function() onPressed;
  const PersonalizedElevatedButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  Color _getTextColor(Color background, BuildContext context) {
    return background.computeLuminance() > 0.5
        ? Theme.of(context).colorScheme.onSecondary
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        minimumSize: Size(250, 35),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(14),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: _getTextColor(color, context),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
