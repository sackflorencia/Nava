import 'package:flutter/material.dart';
import 'package:nava/src/models/goal.dart';
import 'package:nava/src/widgets/goal_preview.dart';

class GridGoalPreview extends StatelessWidget {
  final List<Goal> goals;
  const GridGoalPreview({super.key, required this.goals});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: goals.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GoalPreview(goal: goals[index]);
        },
      ),
    );
  }
}
