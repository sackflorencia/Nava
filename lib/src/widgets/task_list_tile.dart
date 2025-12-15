import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/utils/change_object_values.dart';

class TaskListTile extends StatefulWidget {
  final Task task;
  const TaskListTile({super.key, required this.task});

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  late bool _isChecked = widget.task.isCompleted;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.task.title), 
      subtitle: Text(widget.task.description),
      value: _isChecked,
      onChanged: (bool? newValue){
        changeIsCompletedTaskValue(widget.task.id, newValue);
        setState(() {
          _isChecked = newValue!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(14),
          ),
        ),
    );
  }
}
