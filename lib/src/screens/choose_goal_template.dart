import 'package:flutter/material.dart';
import 'package:nava/src/widgets/list_goal_template.dart';
import 'package:nava/src/widgets/nava_app_bar.dart';

class ChooseGoalTemplate extends StatelessWidget {
  final String goalTitle;
  const ChooseGoalTemplate({super.key, required this.goalTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavaAppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Elegir plantilla para "$goalTitle"',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
              textAlign: TextAlign.center,
            ),
            ListGoalTemplate(goalName: goalTitle),
          ],
        ),
      ),
    );
  }
}
