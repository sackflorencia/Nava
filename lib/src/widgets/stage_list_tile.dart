import 'package:flutter/material.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/utils/get_stage_and_tasks.dart';
import 'package:nava/src/widgets/tasks_list.dart';

class StageListTile extends StatelessWidget{
  final Stage stage;
  const StageListTile({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        children: [
          Text(
            stage.title
          ),
          SizedBox(height: 10,),
          Expanded(child: TasksList(tasks: getTasksByStageId(stage.id)))
        ],
      ),
      
    );
  }
}