import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/models/goal_template.dart';
import 'package:nava/src/utils/add_objects.dart';
import 'package:nava/src/widgets/confirmation_pop_up.dart';
import 'package:string_to_icon/string_to_icon.dart';

class TemplateListTile extends StatelessWidget {
  final GoalTemplate template;
  final String goalName;
  const TemplateListTile({
    super.key,
    required this.template,
    required this.goalName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(
          IconMapper.getIconData(template.iconName),
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          template.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        subtitle: Text(
          template.description,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(14),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            width: 2,
          ),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => ConfirmationPopUp(
              message:
                  '¿Estas seguro de que querés agregar el objetivo $goalName con la plantilla ${template.title}?',
              onpressed: () {
                addGoal(name: goalName, goal: template);
                GoRouter.of(context).go(
                  '/home',
                  extra: "",
                ); //TODO: cambiar el email cuando haga riverpod
                Fluttertoast.showToast(msg: "Ingreso exitoso!");
              },
            ),
          );
        },
      ),
    );
  }
}
