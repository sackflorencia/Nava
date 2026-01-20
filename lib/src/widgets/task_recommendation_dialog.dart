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
        height: MediaQuery.of(context).size.height * 0.6,
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
            size: 120,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            "Encontramos una tarea para vos!",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          TaskPreview(taskId: recommendedTask!.id),
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
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        Text(
          "¿Cuánta energía tenés hoy?",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
          textAlign: TextAlign.center,
        ),
        Column(
          children: [
            ChoiceChip(
              label: Text(
                'Mucha',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
              selected: energyLevel == 3,
              onSelected: (selected) {
                setState(() {
                  energyLevel = 3;
                  recommendedTask = taskRecommendation(widget.goalId, 3);
                });
              },
            ),
            ChoiceChip(
              label: Text(
                'Media',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
              selected: energyLevel == 2,
              onSelected: (selected) {
                setState(() {
                  energyLevel = 2;
                  recommendedTask = taskRecommendation(widget.goalId, 2);
                });
              },
            ),
            ChoiceChip(
              label: Text(
                'Baja',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
              selected: energyLevel == 1,
              onSelected: (selected) {
                setState(() {
                  energyLevel = 1;
                  recommendedTask = taskRecommendation(widget.goalId, 1);
                });
              },
            ),
          ],
        ),
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
