import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/task_recomendation.dart';
import 'package:nava/src/widgets/task_preview.dart';

class TaskRecommendationDialog extends StatefulWidget {
  final int goalId;
  const TaskRecommendationDialog({super.key, required this.goalId});

  @override
  State<TaskRecommendationDialog> createState() =>
      _TaskRecommendationDialogState();
}

class _TaskRecommendationDialogState extends State<TaskRecommendationDialog> {
  Task? recommendedTask;
  int? energyLevel;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.52,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: energyLevel != null
              ? _buildRecommendation()
              : _buildSelection(),
        ),
      ),
    );
  }

  Widget _buildRecommendation() {
    return Column(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        if (recommendedTask != null) ...[
          Icon(
            Icons.celebration,
            size: 90,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            "Encontramos una tarea para vos!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TaskPreview(taskId: recommendedTask!.id),
          ),
        ] else
          Text(
            "No encontramos ninguna tarea para recomendarte.",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }

  Widget _buildSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "¿Cuánta energía tenés hoy?",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        Column(
          children: [
            ChoiceChip(
              label: SizedBox(
                width: 120,
                height: 50,
                child: Center(
                  child: Text(
                    'Mucha',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              padding: EdgeInsets.zero,
              selected: energyLevel == 3,
              onSelected: (selected) {
                setState(() {
                  energyLevel = 3;
                  recommendedTask = taskRecommendation(widget.goalId, 3);
                });
              },
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
            ),
            SizedBox(height: 8),
            ChoiceChip(
              padding: EdgeInsets.zero,
              label: SizedBox(
                width: 120,
                height: 50,
                child: Center(
                  child: Text(
                    'Media',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              selected: energyLevel == 2,
              onSelected: (selected) {
                setState(() {
                  energyLevel = 2;
                  recommendedTask = taskRecommendation(widget.goalId, 2);
                });
              },
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
            ),
            SizedBox(height: 8),
            ChoiceChip(
              padding: EdgeInsets.zero,
              label: SizedBox(
                width: 120,
                height: 50,
                child: Center(
                  child: Text(
                    'Baja',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              selected: energyLevel == 1,
              onSelected: (selected) {
                setState(() {
                  energyLevel = 1;
                  recommendedTask = taskRecommendation(widget.goalId, 1);
                });
              },
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
          "En base a tu energía, te recomendaremos una tarea.",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onInverseSurface,
            fontSize: 21,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
