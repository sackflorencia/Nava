import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/widgets/task_list_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TaskListTile(task: tasks[index]),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
