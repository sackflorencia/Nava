import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nava/src/models/task.dart';
import 'package:nava/src/services/get_objects_and_lists.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/navbar.dart';
import 'package:nava/src/widgets/stages_dropdown.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    late TextEditingController taskTitleController = TextEditingController(text: task.title);
    late TextEditingController taskDescriptionController = TextEditingController(text: task.description);

    return Scaffold(
      appBar: NavaAppBar(),
      drawer: Navbar(),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                taskId: task.id,
                stages: getStagesByTaskId(task.id),
                selectedStage: getStageById(task.idStage),
              ),
              TextField(
                controller: taskTitleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
              TextField(
                controller: taskDescriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
