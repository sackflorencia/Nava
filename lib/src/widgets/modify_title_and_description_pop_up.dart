import 'package:flutter/material.dart';
import 'package:nava/src/widgets/little_textfield.dart';
import 'package:nava/src/widgets/personalized_elevated_button.dart';
import 'package:nava/src/widgets/personalized_text_button.dart';

class ModifyTitleAndDescriptionPopUp extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController? descriptionController;
  final Function() onConfirm;
  const ModifyTitleAndDescriptionPopUp({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Text(
          'Modificar',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        actions: [
          LittleTextField(
            hintText: 'Título',
            controller: titleController,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 10),
          if (descriptionController != null) ...[
            SizedBox(
              height: 100,
              child: TextField(
                expands: true,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                controller: descriptionController!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'Descripción',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: 0.2),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
          Center(
            child: PersonalizedElevatedButton(
              onPressed: onConfirm,
              text: 'Confirmar',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Center(
            child: PersonalizedTextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Cancelar',
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ),
        ],
      ),
    );
  }
}
