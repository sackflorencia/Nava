import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/change_object_values.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/stages_dropdown.dart';
import 'package:nava/src/widgets/task_difficulty_details.dart';
import 'package:nava/src/widgets/task_estimated_time_details.dart';

class TaskDetails extends StatefulWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  late Task _task;
  late TextEditingController taskTitleController;
  late TextEditingController taskDescriptionController;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
    taskTitleController = TextEditingController(text: _task.title);
    taskDescriptionController = TextEditingController(
      text: _task.description ?? '',
    );
  }

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavaAppBar(),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
              StagesDropdown(
                taskId: _task.id,
                stages: getStagesByTaskId(_task.id),
                selectedStage: getStageById(_task.idStage),
              ),
              TextField(
                controller: taskTitleController,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                onChanged: (value) {
                  setState(() {
                    _task = _task.copyWith(title: taskTitleController.text);
                  });
                  changeTaskValues(_task.id, title: taskTitleController.text);
                },
              ),
              TextField(
                controller: taskDescriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      (_task.description == null || _task.description!.isEmpty)
                      ? 'Agregar descripción'
                      : null,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(
                    Icons.notes,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    _task = _task.copyWith(
                      description: taskDescriptionController.text,
                    );
                  });
                  changeTaskValues(
                    _task.id,
                    description: taskDescriptionController.text,
                  );
                },
              ),
              TaskEstimatedTimeDetails(
                estimatedMinutes: _task.estimatedMinutes,
                taskid: _task.id,
                onEstimatedTimeChanged: (minutes) {
                  setState(() {
                    _task = _task.copyWith(estimatedMinutes: minutes);
                  });
                  changeTaskValues(_task.id, estimatedMinutes: minutes);
                },
              ),
              TaskDifficultyDetails(
                taskId: _task.id,
                difficulty: _task.difficulty,
                onDifficultyChanged: (int level) {
                  changeTaskValues(_task.id, difficulty: level);
                  setState(() {
                    _task = _task.copyWith(difficulty: level);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
