import 'package:flutter/material.dart';

class PersonalizedOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color foregroundColor;
  const PersonalizedOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        minimumSize: Size(250, 35),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(14),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        side: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(30)
      ),
      child: Text(text),
    );
  }
}
