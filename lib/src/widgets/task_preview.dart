import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';

class TaskPreview extends StatelessWidget {
  final int taskId;
  final bool isLinked;
  const TaskPreview({super.key, required this.taskId, this.isLinked = true});

  @override
  Widget build(BuildContext context) {
    late Task? task = getTaskById(taskId);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onInverseSurface,
          width: 1.5,
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: ElevatedButton(
        onPressed: isLinked
            ? () {
                GoRouter.of(context).go('/task_details', extra: task!);
              }
            : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Theme.of(context).colorScheme.onPrimary,
          ),
          elevation: WidgetStateProperty.all(0),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task?.title ?? "Tarea no encontrada",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              if (task?.description != null && task!.description!.isNotEmpty)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.notes,
                      size: 20,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        task.description!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(
                            context,
                          ).colorScheme.onInverseSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              if (task?.estimatedMinutes != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      size: 20,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Tiempo estimado: ${task?.estimatedMinutes} minutos',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(
                            context,
                          ).colorScheme.onInverseSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              if (task?.difficulty != null)
                Row(
                  children: [
                    Icon(
                      Icons.whatshot,
                      size: 20,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                    const SizedBox(width: 6),
                    switch (task!.difficulty!) {
                      1 => Text(
                        'Dificultad: Fácil',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(
                            context,
                          ).colorScheme.onInverseSurface,
                        ),
                      ),
                      2 => Text(
                        'Dificultad: Media',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(
                            context,
                          ).colorScheme.onInverseSurface,
                        ),
                      ),
                      3 => Text(
                        'Dificultad: Difícil',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(
                            context,
                          ).colorScheme.onInverseSurface,
                        ),
                      ),
                      _ => const SizedBox(),
                    },
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
