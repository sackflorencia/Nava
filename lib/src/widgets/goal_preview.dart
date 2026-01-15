import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/services/get_tasks_left_in_stage.dart';

class GoalPreview extends StatelessWidget {
  final Goal goal;
  const GoalPreview({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    final Stage? currentStage = getCurrentStage(goal.id);
    final int tasksLeft = getTaskLeftInCurrentStage(goal.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              goal.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: currentStage == null
                ? Text(
                    'Finalizada',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    'Quedan $tasksLeft tareas para finalizar la etapa "${currentStage.title}"',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
            tileColor: Theme.of(context).colorScheme.surfaceContainerHighest, 
            onTap: () {
              GoRouter.of(context).go('/goal_view', extra: goal);
            },
          ),
          SizedBox(height: 7,)
        ],
      ),
    );
  }
}
