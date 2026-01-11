import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/theme/theme_utils.dart';
import 'package:nava/src/services/change_object_values.dart';

class TaskListTile extends StatefulWidget {
  final Task task;
  final VoidCallback onChanged;
  final int index;
  const TaskListTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.index,
  });

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  late bool _isChecked;
  late final TextEditingController taskTitleController;
  late final TextEditingController taskDescriptionController;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.task.isCompleted;
    taskTitleController = TextEditingController();
    taskDescriptionController = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant TaskListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.task.isCompleted != widget.task.isCompleted) {
      _isChecked = widget.task.isCompleted;
    }
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
      child: InkWell(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
        onTap: () {
          GoRouter.of(
          context,
        ).go('/task_details', extra: widget.task);
        }, 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? newValue) {
                  if (newValue == null) return;
                  changeIsCompletedTaskValue(widget.task.id, newValue);
                  setState(() {
                    _isChecked = newValue;
                  });
                  widget.onChanged();
                },
                activeColor: Theme.of(context).colorScheme.secondary,
                checkColor: Theme.of(context).colorScheme.surface,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  width: 2,
                ),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                        decoration: _isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationThickness: 2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.task.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        decoration: _isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ReorderableDragStartListener(
                index: widget.task.order,
                child: Icon(
                  Icons.drag_handle,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
