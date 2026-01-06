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

  @override
  Widget build(BuildContext context) {
    final sortedTasks = _sortedTasks();
    return ReorderableListView.builder(
      itemCount: sortedTasks.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          key: ValueKey(sortedTasks[index].id),
          children: [
            TaskListTile(
              task: sortedTasks[index],
              onChanged: widget.onChanged,
              index: index
            ),
            SizedBox(height: 10),
          ],
        );
      },
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex -= 1;

        final movedTask = sortedTasks[oldIndex];
        final newOrder = sortedTasks[newIndex].order;

        setState(() {
          changeTasksOrder(movedTask.id, newOrder);
          widget.onChanged();
        });
      },
    );
  }
}
