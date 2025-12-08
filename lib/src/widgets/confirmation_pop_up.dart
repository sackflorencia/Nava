import 'package:flutter/material.dart';
import 'package:nava/src/widgets/personalized_elevated_button.dart';
import 'package:nava/src/widgets/personalized_text_button.dart';

class ConfirmationPopUp extends StatelessWidget {
  final Function onpressed;
  final String message;
  const ConfirmationPopUp({
    super.key,
    required this.onpressed,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(message),
      actions: [
        PersonalizedElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Confirmar',
          color: Theme.of(context).colorScheme.primary,
        ),
        PersonalizedTextButton(
          onPressed: () {
            onpressed();
            Navigator.of(context).pop();
          },
          text: 'Cancelar',
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
