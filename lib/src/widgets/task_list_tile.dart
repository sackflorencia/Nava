import 'package:flutter/material.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/theme/theme_utils.dart';
import 'package:nava/src/utils/change_object_values.dart';
import 'package:nava/src/widgets/modify_title_and_description_pop_up.dart';

class TaskListTile extends StatefulWidget {
  final Task task;
  final Function() onChanged;
  const TaskListTile({super.key, required this.task, required this.onChanged});

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  late Task _task = widget.task;
  late bool _isChecked = _task.isCompleted;
  late final TextEditingController taskTitleController;
  late final TextEditingController taskDescriptionController;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
    taskTitleController = TextEditingController();
    taskDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

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
          _task.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            decoration: _isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2,
            fontStyle: _isChecked ? FontStyle.italic : FontStyle.normal,
          ),
        ),
        subtitle: Text(
          _task.description,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            decoration: _isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2,
            fontStyle: _isChecked ? FontStyle.italic : FontStyle.normal,
          ),
        ),
        secondary: IconButton(
          onPressed: () {
            taskDescriptionController.text = _task.description;
            taskTitleController.text = _task.title;
            showDialog(
              context: context,
              builder: (context) {
                return ModifyTitleAndDescriptionPopUp(
                  descriptionController: taskDescriptionController,
                  onConfirm: () {
                    setState(() {
                      changeTaskTitleAndDescription(
                        _task.id,
                        taskTitleController.text,
                        taskDescriptionController.text,
                      );
                      _task = _task.copyWith(
                        title: taskTitleController.text,
                        description: taskDescriptionController.text,
                      );
                    });
                    Navigator.of(context).pop();
                  },
                  titleController: taskTitleController,
                );
              },
            );
          },
          icon: Icon(Icons.edit),
        ),
        value: _isChecked,
        onChanged: (bool? newValue) {
          changeIsCompletedTaskValue(_task.id, newValue);
          setState(() {
            _isChecked = newValue!;
          });
          widget.onChanged();
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
