import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';

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
            ListTile(
              title: Text(tasks[index].title),
              subtitle: Text(tasks[index].description),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
