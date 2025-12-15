import 'package:flutter/material.dart';
import 'package:nava/src/widgets/little_textfield.dart';
import 'package:nava/src/widgets/personalized_elevated_button.dart';
import 'package:nava/src/widgets/personalized_text_button.dart';

class ModifyTitleAndDescriptionPopUp extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final Function() onConfirm;
  const ModifyTitleAndDescriptionPopUp({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.onConfirm
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Text('Modificar título y descripción'),
        actions: [
          LittleTextField(hintText: 'Título', controller: titleController),
          SizedBox(height: 10,),
          LittleTextField(hintText: 'Descripción', controller: descriptionController),
          SizedBox(height: 10,),
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
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
