import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/theme/theme_utils.dart';
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
    return Material(
      color: lighten(
        Theme.of(context).colorScheme.surfaceContainerHighest,
        0.07,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(14),
      ),
      child: CheckboxListTile(
        title: Text(
          widget.task.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            decoration: _isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontStyle: _isChecked ? FontStyle.italic : FontStyle.normal,
          ),
        ),
        subtitle: Text(
          widget.task.description,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            decoration: _isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2,
            fontStyle: _isChecked ? FontStyle.italic : FontStyle.normal,
          ),
        ),
        value: _isChecked,
        onChanged: (bool? newValue) {
          changeIsCompletedTaskValue(widget.task.id, newValue);
          setState(() {
            _isChecked = newValue!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Theme.of(context).colorScheme.secondary,
        checkColor: Theme.of(context).colorScheme.surface,
        side: BorderSide(
          color: Theme.of(context).colorScheme.onInverseSurface,
          width: 2,
        ),
      ),
    );
  }
}
