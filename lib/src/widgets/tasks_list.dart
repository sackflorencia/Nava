import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/widgets/task_list_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final VoidCallback onChanged;
  const TasksList({super.key, required this.tasks, required this.onChanged});
  List<Task> _sortedTasks() {
    final sorted = List<Task>.from(tasks);
    sorted.sort((a, b) {
      if (a.isCompleted != b.isCompleted) {
        return a.isCompleted ? 1 : -1;
      }
      return a.order.compareTo(b.order);
    });
    return sorted;
  }
  @override
  Widget build(BuildContext context) {
    final sortedTasks = _sortedTasks();
    return ListView.builder(
      itemCount: sortedTasks.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TaskListTile(
              key: ValueKey(sortedTasks[index].id),
              task: sortedTasks[index],
              onChanged: onChanged,
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
