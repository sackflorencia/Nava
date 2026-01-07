import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: NavaAppBar(),
      drawer: Navbar(),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StagesDropdown(
                onSelected: () {},
                stages: getStagesByTaskId(task.id),
                selectedStage: getStageById(task.idStage),
              ),
              TextField(),
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                task.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
    );
  }
}
