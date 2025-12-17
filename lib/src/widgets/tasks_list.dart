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
  late List<Task> _tasks;
  @override
  void initState() {
    super.initState();
    _tasks = List.from(widget.tasks);
    _sortTasks();
  }

  void _sortTasks() {
    _tasks.sort((a, b) {
      if (a.isCompleted != b.isCompleted) {
        return a.isCompleted ? 1 : -1;
      }
      return a.order.compareTo(b.order);
    });
  }

  void _onTaskToggled() {
    setState(() {
      _sortTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TaskListTile(
              task: _tasks[index],
              onChanged: _onTaskToggled,
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
