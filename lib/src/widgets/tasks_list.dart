import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/widgets/task_list_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  const TasksList({super.key, required this.tasks});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TaskListTile(task: widget.tasks[index]),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
