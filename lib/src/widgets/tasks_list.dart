import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/change_object_values.dart';
import 'package:nava/src/widgets/task_list_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  final VoidCallback onChanged;
  const TasksList({super.key, required this.tasks, required this.onChanged});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> _sortedTasks() {
    final sorted = List<Task>.from(widget.tasks);
    sorted.sort((a, b) {
      if (a.isCompleted != b.isCompleted) {
        return a.isCompleted ? 1 : -1;
      }
      return a.order.compareTo(b.order);
    });
    return sorted;
  }

  void _handleDrop(Task task, int newIndex) {
    if (task.order == newIndex) return;

    changeTasksOrder(task.id, newIndex);
    widget.onChanged();
  }
  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = _sortedTasks();

    return ListView.builder(
      itemCount: tasks.length + 1,
      itemBuilder: (context, index) {
        // DragTarget ENTRE tasks
        if (index < tasks.length) {
          final targetTask = tasks[index];

          return DragTarget<Task>(
            onWillAcceptWithDetails: (_) => true,
            onAcceptWithDetails: (details) {
              final task = details.data;
              _handleDrop(task, targetTask.order);
            },
            builder: (context, candidateData, _) {
              return Column(
                children: [
                  if (candidateData.isNotEmpty)
                    Container(
                      height: 6,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withAlpha(150),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  TaskListTile(
                    task: targetTask,
                    index: index,
                    onChanged: widget.onChanged,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          );
        }

        // DragTarget final (drop al final)
        return DragTarget<Task>(
          onWillAcceptWithDetails: (_) => true,
          onAcceptWithDetails: (details) {
            final task = details.data;
            _handleDrop(task, tasks.length);
          },
          builder: (_, _, _) => const SizedBox(height: 40),
        );
      },
    );
  }
}
