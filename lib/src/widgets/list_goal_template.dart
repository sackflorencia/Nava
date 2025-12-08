import 'package:flutter/material.dart';
import 'package:nava/src/models/goal_template.dart';
import 'package:nava/src/widgets/template_list_tile.dart';

class ListGoalTemplate extends StatelessWidget {
  const ListGoalTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: goalTemplates.length,
        itemBuilder: (context, index) {
          GoalTemplate template = goalTemplates[index];
          return TemplateListTile(template: template);
        },
      ),
    );
  }
}
