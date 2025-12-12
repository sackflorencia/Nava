import 'package:flutter/material.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/models/stage.dart';
import 'package:nava/src/utils/get_stage_and_tasks.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';
import 'package:nava/src/widgets/navbar.dart';
import 'package:nava/src/widgets/stage_list_tile.dart';

class GoalView extends StatelessWidget {
  final Goal goal;
  const GoalView({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    late List<Stage> stages = getStagesByGoalId(goal.id); 
    return Scaffold(
      appBar: NavaAppBar(),
      drawer: Navbar(),
      body: Center(
        child: Column(
          children: [
            Text(
              goal.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 20,
              ),
            ),
            Text(
              goal.description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 14,
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stages.length,
              itemBuilder: (context, index) {
                Stage stage = stages[index];
                return StageListTile(stage: stage);
              },
            )
            
          ],
        ),
      ),
    );
  }
}
