import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/models/goal.dart';

class GoalPreview extends StatelessWidget {
  final Goal goal;
  const GoalPreview({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).go('/goal_view', extra: goal);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
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
          side: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                goal.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                //'Ánimo! Quedan ${goal.tasksLeftInStage} tareas para finalizar la etapa "${goal.currentStage}"',
                //TODO: Crear una funcion que me diga cuantas tasks hay left in stage y la current stage
                'Hola',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
