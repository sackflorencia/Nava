import 'package:flutter/material.dart';
import 'package:nava/src/models/goal_template.dart';

class GoalTemplatePreview extends StatelessWidget {
  final GoalTemplate goalTemplate;
  final Function onAccepted;
  const GoalTemplatePreview({
    super.key,
    required this.goalTemplate,
    required this.onAccepted,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
              SizedBox(height: 8),
              Text(
                goalTemplate.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: goalTemplate.stages.length,
                    itemBuilder: (context, index) =>
                        _buildStageItem(goalTemplate.stages[index], context, index == goalTemplate.stages.length - 1),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  minimumSize: const Size(200, 48),
                ),
                onPressed: () => onAccepted(),
                child: const Text('Elegir esta plantilla', textAlign: TextAlign.center),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStageItem(StageTemplate stage, BuildContext context, bool isLast) {
    return Column(
      children: [
        ExpansionTile(
          iconColor: Theme.of(context).colorScheme.onInverseSurface,
          collapsedIconColor: Theme.of(context).colorScheme.onInverseSurface,
          textColor: Theme.of(context).colorScheme.onInverseSurface,
          collapsedTextColor: Theme.of(context).colorScheme.onInverseSurface,
          shape: const Border(),
          collapsedShape: const Border(),
          title: Text(
            stage.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ),
          children: stage.tasks
              .map(
                (task) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 16.8,
                        color: Theme.of(context).colorScheme.onInverseSurface,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Divider(
          height: 1,
          thickness: 0.5, 
          color: Theme.of(context).dividerColor,
        ),
      ],
    );
  }
}
